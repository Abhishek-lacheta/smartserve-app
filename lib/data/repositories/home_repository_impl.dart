import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/home_item_entity.dart';
import '../../domain/repositories/i_home_repository.dart';
import '../datasources/firestore_datasource.dart';

@LazySingleton(as: IHomeRepository)
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class HomeRepositoryImpl implements IHomeRepository {
  final FirestoreDataSource _firestoreDataSource;

  HomeRepositoryImpl(this._firestoreDataSource);

  @override
  Future<Either<Failure, List<String>>> getTopCategories() async {
    try {
      final result = await _firestoreDataSource.getTopCategories();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));







    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final result = await _firestoreDataSource.getCategories();
      return Right(result); // CategoryModel extends CategoryEntity
    } catch (e) {
      return Left(ServerFailure(e.toString()));
