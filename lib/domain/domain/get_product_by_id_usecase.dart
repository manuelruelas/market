import 'package:dartz/dartz.dart';
import 'package:market/core/errors/failures.dart';
import 'package:market/core/usecases/usecase.dart';
import 'package:market/domain/entities/product.dart';
import 'package:market/domain/repositories/products_repository.dart';

class GetProductByIdUsecase extends UseCase<Product, String> {
  GetProductByIdUsecase(this.productRepository);

  final ProductsRepository productRepository;

  @override
  Future<Either<Failure, Product>> call(String params) {
    return productRepository.getProductById(params);
  }
}
