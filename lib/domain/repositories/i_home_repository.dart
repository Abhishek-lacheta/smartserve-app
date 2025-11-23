import 'package:fpdart/fpdart.dart';
import '../../core/error/failure.dart';
import '../entities/category_entity.dart';
import '../entities/home_item_entity.dart';

abstract class IHomeRepository {
  Future<Either<Failure, List<String>>> getTopCategories();
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<HomeItemEntity>>> getHomeItems();







}
