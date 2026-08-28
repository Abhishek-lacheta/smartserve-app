import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../models/home_item_model.dart';
import '../models/category_model.dart';
import '../../mock_data/mock_home_data.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class FirestoreDataSource {
  final FirebaseFirestore _firestore;

  FirestoreDataSource({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // Save User
  Future<void> saveUser(UserModel user) async {
    try {
      final data = user.toMap();
      data['updatedAt'] = FieldValue.serverTimestamp();
      
      final docRef = _firestore.collection('users').doc(user.uid);
      final snapshot = await docRef.get();
      if (!snapshot.exists) {
        data['createdAt'] = FieldValue.serverTimestamp();


      }
      
      await docRef.set(data, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to save user data: $e');
    }
  }

  // Seed Firestore if Empty (to satisfy assignment requirements with exact UI)
  Future<void> seedFirestoreIfEmpty() async {
    try {
      final productsSnapshot = await _firestore.collection('home_products').limit(1).get();
      if (productsSnapshot.docs.isEmpty) {
        // Seed Top Categories
        for (int i = 0; i < MockData.topCategories.length; i++) {
          await _firestore.collection('home_top_categories').add({
            'name': MockData.topCategories[i],
            'order': i,
          });
        }

        // Seed Categories
        for (int i = 0; i < MockData.categories.length; i++) {
          final cat = MockData.categories[i];
          await _firestore.collection('home_categories').add({
            'title': cat['title'],
            'iconName': _getIconName(cat['icon']),
            'order': i,
          });
        }

        // Seed Products
        for (final prod in MockData.products) {
          await _firestore.collection('home_products').add({
            'title': prod['title'],
            'price': prod['price'],
            'rating': prod['rating'],
            'reviews': prod['reviews'],
            'iconName': _getIconName(prod['icon']),
          });
        }
      }
    } catch (e) {
      debugPrint('Seed failed (probably due to security rules): $e');
    }
  }

  String _getIconName(IconData icon) {
    if (icon == Icons.face) return 'face';
    if (icon == Icons.local_offer) return 'local_offer';
    if (icon == Icons.checkroom) return 'checkroom';
    if (icon == Icons.home) return 'home';
    if (icon == Icons.dry_cleaning) return 'dry_cleaning';
    if (icon == Icons.shopping_bag) return 'shopping_bag';
    if (icon == Icons.accessibility_new) return 'accessibility_new';
    if (icon == Icons.phone_iphone) return 'phone_iphone';
    if (icon == Icons.brush) return 'brush';
    if (icon == Icons.color_lens) return 'color_lens';
    if (icon == Icons.spa) return 'spa';
    if (icon == Icons.water_drop) return 'water_drop';
    return 'category';
  }

  // Get Top Categories
  Future<List<String>> getTopCategories() async {
    try {
      final QuerySnapshot snapshot = 
          await _firestore.collection('home_top_categories').orderBy('order').get();

      return snapshot.docs.map((doc) {
        return (doc.data() as Map<String, dynamic>)['name'] as String? ?? '';
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch top categories: $e');
    }
  }

  // Get Categories
  Future<List<CategoryModel>> getCategories() async {
    try {
      final QuerySnapshot snapshot = 
          await _firestore.collection('home_categories').orderBy('order').get();

      return snapshot.docs.map((doc) {
        return CategoryModel.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }

  // Get Home Items (Products)
  Future<List<HomeItemModel>> getHomeItems() async {
    try {
      final QuerySnapshot snapshot = 
          await _firestore.collection('home_products').get();

      return snapshot.docs.map((doc) {
        return HomeItemModel.fromMap(
