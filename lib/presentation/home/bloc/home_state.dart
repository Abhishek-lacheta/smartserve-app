import 'package:equatable/equatable.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/home_item_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object?> get props => [];


}

/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<String> topCategories;
  final List<CategoryEntity> categories;
  final List<HomeItemEntity> items;

  const HomeLoaded({
    required this.topCategories,
    required this.categories,
    required this.items,
  });

  @override
  List<Object?> get props => [topCategories, categories, items];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
