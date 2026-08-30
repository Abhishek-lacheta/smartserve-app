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
            ),
          ),
        ),
      ],
    );










  }
}

class _LShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryCyan
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // Starting top-left of the L
    path.moveTo(0, 0);
    // Draw straight down
    path.lineTo(0, size.height);
    // Draw straight right to bottom-right
    path.lineTo(size.width, size.height);
    // Draw slanted up-left to the inner corner
    path.lineTo(size.width * 0.35, size.height * 0.65);
    // Draw straight up to inner-top
    path.lineTo(size.width * 0.35, size.height * 0.35);
    // Slant to top-left to close? The screenshot shows a triangle pointing bottom right
    // Let's approximate the 'L' shape from the logo:
    // It looks like a tall triangle on the left and a shorter triangle on the bottom.
    // Actually, it's an 'L' where the top left is sharp, bottom left is sharp, bottom right is sharp,
    // inner corner is sharp, top inner corner is slanted towards top left.
    path.reset();
    path.moveTo(0, 0); // top left
    path.lineTo(0, size.height); // bottom left
    path.lineTo(size.width * 0.9, size.height); // bottom right (extends out)
    path.lineTo(size.width * 0.35, size.height * 0.65); // inner corner slanted
    path.lineTo(size.width * 0.35, size.height * 0.35); // inner vertical
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
