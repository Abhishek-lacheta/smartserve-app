import '../datasources/firestore_datasource.dart';
import '../models/home_item_model.dart';
import '../models/category_model.dart';

/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class HomeRepository {
  final FirestoreDataSource _firestoreDataSource;

  HomeRepository({FirestoreDataSource? firestoreDataSource})
      : _firestoreDataSource = firestoreDataSource ?? FirestoreDataSource();

  Future<List<String>> getTopCategories() async {
    try {
      return await _firestoreDataSource.getTopCategories();
    } catch (e) {
      throw Exception('Repository error fetching top categories: $e');








    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      return await _firestoreDataSource.getCategories();
    } catch (e) {
      throw Exception('Repository error fetching categories: $e');
    }
  }

  Future<List<HomeItemModel>> getHomeItems() async {
    try {
      return await _firestoreDataSource.getHomeItems();
    } catch (e) {
      throw Exception('Repository error fetching home items: $e');
    }
  }
}
