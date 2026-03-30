import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class CategoryEntity extends Equatable {
  final String id;
  final String title;
  final String iconName;

  const CategoryEntity({
    required this.id,
    required this.title,
    required this.iconName,
  });

  IconData get icon {
    switch (iconName) {
      case 'face':
        return Icons.face;
      case 'local_offer':
        return Icons.local_offer;
      case 'checkroom':
        return Icons.checkroom;
      case 'home':
        return Icons.home;
      case 'dry_cleaning':
        return Icons.dry_cleaning;
      case 'shopping_bag':
        return Icons.shopping_bag;
      case 'accessibility_new':
        return Icons.accessibility_new;
      case 'phone_iphone':
        return Icons.phone_iphone;
      default:
        return Icons.category;




    }
  }

