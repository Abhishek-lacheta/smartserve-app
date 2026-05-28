import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class HomeItemEntity extends Equatable {
  final String id;
  final String title;
  final String price;
  final double rating;
  final int reviews;
  final String iconName;

  const HomeItemEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.iconName,
  });

  IconData get icon {
    switch (iconName) {
      case 'brush':
        return Icons.brush;
      case 'color_lens':
        return Icons.color_lens;
      case 'spa':
        return Icons.spa;
      case 'water_drop':
        return Icons.water_drop;
      default:
        return Icons.shopping_bag;

    }
  }

  @override
  List<Object?> get props => [id, title, price, rating, reviews, iconName];
}
