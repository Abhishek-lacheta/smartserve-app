import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final double rating;
  final int reviews;
  final IconData placeholderIcon;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.placeholderIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.05),
