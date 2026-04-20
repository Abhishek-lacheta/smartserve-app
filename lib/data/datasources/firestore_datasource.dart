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
