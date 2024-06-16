import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market/domain/domain/get_product_by_id_usecase.dart';
import 'package:market/domain/entities/product.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit({required this.getProductByIdUsecase})
      : super(const ProductDetailState());

  final GetProductByIdUsecase getProductByIdUsecase;

  Future<void> getProductById(String id) async {
    emit(state.copyWith(status: ProductDetailStatus.loading));
    final productOrFailure = await getProductByIdUsecase(id);
    productOrFailure.fold(
      (failure) => emit(state.copyWith(status: ProductDetailStatus.error)),
      (product) => emit(
          state.copyWith(product: product, status: ProductDetailStatus.loaded)),
    );
  }
}
