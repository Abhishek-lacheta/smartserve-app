import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/usecases/usecase.dart';
import '../../../domain/usecases/auth_usecases.dart';
import 'auth_event.dart';
import 'auth_state.dart';

/// **AuthBloc**
/// 
/// This BLoC manages the authentication state of the application using Clean Architecture UseCases.
/// It interacts with [SignInWithGoogleUseCase], [SignOutUseCase], and [GetAuthStateChangesUseCase].
/// 
/// **Genius-Level Insight:**
/// We don't just check the initial auth state once. We listen to the `authStateChanges` stream
/// provided by Firebase. This means if the user is deleted on the server, or logs out from another
/// tab/session, the app will reactively push an [Unauthenticated] state, immediately kicking them
/// out of the protected routes.
@injectable
/// Manages state transitions and events for this feature block.
/// Manages state transitions and events for this feature block.
/// Manages state transitions and events for this feature block.
/// Manages state transitions and events for this feature block.
/// Manages state transitions and events for this feature block.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetAuthStateChangesUseCase _getAuthStateChangesUseCase;

  AuthBloc(
    this._signInWithGoogleUseCase,
    this._signOutUseCase,
    this._getAuthStateChangesUseCase,
  ) : super(AuthInitial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<SignInRequested>(_onSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);





  }

  /// Listens to the auth stream. Reactive programming at its finest.
  Future<void> _onCheckAuthStatus(CheckAuthStatus event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await emit.forEach(
      _getAuthStateChangesUseCase(),
      onData: (user) {
        if (user != null) {
          return Authenticated(user);
        } else {
          return Unauthenticated();
        }
      },
      onError: (_, __) => const AuthError("Failed to verify authentication status."),
    );
  }

  Future<void> _onSignInRequested(SignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _signInWithGoogleUseCase(NoParams());
    
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> _onSignOutRequested(SignOutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _signOutUseCase(NoParams());
    
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(Unauthenticated()),
    );
  }
}
