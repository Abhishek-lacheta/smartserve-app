import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/luxeloft_logo.dart';
import '../../widgets/product_card.dart';

import '../../presentation/home/bloc/home_bloc.dart';
import '../../presentation/home/bloc/home_event.dart';
import '../../presentation/home/bloc/home_state.dart';
import '../../presentation/auth/bloc/auth_bloc.dart';
import '../../presentation/auth/bloc/auth_event.dart';
import '../../presentation/auth/bloc/auth_state.dart';
import '../auth/login_screen.dart';

/// Provides core implementation and business logic properties.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();



}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadHomeData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator(color: AppColors.primaryOrange));
              } else if (state is HomeFailure) {
                return Center(child: Text('Failed to load data. Please try again.', style: TextStyle(color: Colors.red)));
              } else if (state is HomeLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                // Custom AppBar Area
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Tap menu to logout as required for testing
                          context.read<AuthBloc>().add(LogoutRequested());
                        },
                        child: const Icon(Icons.logout, color: AppColors.textPrimary),
                      ),
                      const LuxeLoftLogo(size: 30),
                      Row(
                        children: [
                          const Icon(Icons.search, color: AppColors.textPrimary),
                          const SizedBox(width: 16),
                          Icon(Icons.qr_code_scanner, color: AppColors.textPrimary.withOpacity(0.8)),
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Greeting and Title
                Padding(
