import 'package:dartz/dartz.dart';
import 'package:market/core/errors/failures.dart';
import 'package:market/core/usecases/no_params.dart';
import 'package:market/core/usecases/usecase.dart';
import 'package:market/domain/entities/product.dart';
import 'package:market/domain/repositories/products_repository.dart';

class GetProductsUsecase extends UseCase<List<Product>, NoParams> {
  final ProductsRepository repository;

  GetProductsUsecase(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await repository.getProducts();
  }
}
