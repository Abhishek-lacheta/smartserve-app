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

