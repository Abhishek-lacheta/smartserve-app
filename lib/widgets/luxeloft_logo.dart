import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class LuxeLoftLogo extends StatelessWidget {
  final double size;

  const LuxeLoftLogo({super.key, this.size = 60});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Custom L Shape using CustomPaint
        CustomPaint(
          size: Size(size, size),
          painter: _LShapePainter(),
        ),
        const SizedBox(width: 4),
        // uxeLoft Text
        Padding(
          padding: EdgeInsets.only(bottom: size * 0.15),
          child: Text(
            'uxeLoft',
            style: TextStyle(
              fontSize: size * 0.6,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryOrange,
              letterSpacing: -1,
