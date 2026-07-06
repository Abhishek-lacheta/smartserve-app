import '../../domain/entities/home_item_entity.dart';

/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class HomeItemModel extends HomeItemEntity {
  const HomeItemModel({
    required super.id,
    required super.title,
    required super.price,
    required super.rating,
    required super.reviews,
    required super.iconName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'rating': rating,
      'reviews': reviews,
      'iconName': iconName,
    };




  }

  factory HomeItemModel.fromMap(Map<String, dynamic> map, String documentId) {
    return HomeItemModel(
      id: documentId,
      title: map['title']?.toString() ?? '',
      price: map['price']?.toString() ?? '',
      rating: (map['rating'] is num) ? (map['rating'] as num).toDouble() : 0.0,
      reviews: (map['reviews'] is num) ? (map['reviews'] as num).toInt() : 0,
      iconName: map['iconName']?.toString() ?? 'brush',
    );
  }
}
