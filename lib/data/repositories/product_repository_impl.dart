import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:market/core/errors/failures.dart';
import 'package:market/data/data_sources/remote/products_service.dart';
import 'package:market/domain/entities/product.dart';
import 'package:market/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsService productDataSource;

  ProductsRepositoryImpl({required this.productDataSource});

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await productDataSource.getProducts();
      return Right(products.map((e) => e.toEntity()).toList());
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure("Fallo al obtener los productos"));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(String id) async {
    try {
      final product = await productDataSource.getProductById(id);
      return Right(product.toEntity());
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure("Fallo al obtener el producto"));
    }
  }
}
