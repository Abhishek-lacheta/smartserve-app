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
