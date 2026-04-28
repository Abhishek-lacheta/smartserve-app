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
