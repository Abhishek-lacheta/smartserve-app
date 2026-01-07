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
