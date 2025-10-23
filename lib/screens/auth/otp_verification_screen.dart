import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../core/theme/app_colors.dart';
import '../home/main_navigation.dart';

/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: Padding(
