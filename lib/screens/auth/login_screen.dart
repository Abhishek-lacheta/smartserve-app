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
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User details saved successfully'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainNavigation()),
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );

        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top right close button
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, size: 28),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 20),
                
                // Logo
                const LuxeLoftLogo(size: 60),
                const SizedBox(height: 40),
                
                // Welcome Text
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Login to continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 40),
                
                // Phone Input
                const CustomTextField(
                  hintText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone_android_outlined),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                
                // Get OTP Button
                CustomButton(
                  text: 'GET OTP',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtpVerificationScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 60),
                
                // Social Login
                const Text(
                  'Or Continue With',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return SocialLoginButton(
                          text: 'Google',
                          icon: Icons.g_mobiledata, // Placeholder for Google icon
                          iconColor: Colors.blue, // Approximation
                          onPressed: () {
                            context.read<AuthBloc>().add(GoogleSignInRequested());
                          },
                        );
                      },
                    ),
                    const SizedBox(width: 20),
                    SocialLoginButton(
                      text: 'Facebook',
                      icon: Icons.facebook,
                      iconColor: Colors.blue[800],
                      onPressed: () {},
                    ),
                  ],
                ),
                
                const SizedBox(height: 60),
                
                // Sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateAccountScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: AppColors.primaryCyan,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryCyan,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Loading Indicator overlay check (optional since BlocListener handles the state but good for visual feedback)
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
