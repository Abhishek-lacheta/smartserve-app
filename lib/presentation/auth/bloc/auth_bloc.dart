import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/usecases/usecase.dart';
import '../../../domain/usecases/auth_usecases.dart';
import 'auth_event.dart';
import 'auth_state.dart';

/// **AuthBloc**
/// 
/// This BLoC manages the authentication state of the application using Clean Architecture UseCases.
