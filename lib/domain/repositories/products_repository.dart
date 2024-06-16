import 'package:dartz/dartz.dart';
import 'package:market/core/errors/failures.dart';
import 'package:market/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, Product>> getProductById(String id);
}
