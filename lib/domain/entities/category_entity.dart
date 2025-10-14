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
