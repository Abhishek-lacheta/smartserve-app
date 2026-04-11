import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/luxeloft_logo.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/social_login_button.dart';
import '../../core/theme/app_colors.dart';
import 'create_account_screen.dart';
import 'otp_verification_screen.dart';
import '../home/main_navigation.dart';
import '../../presentation/auth/bloc/auth_bloc.dart';
import '../../presentation/auth/bloc/auth_event.dart';
import '../../presentation/auth/bloc/auth_state.dart';

/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
