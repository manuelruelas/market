import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/usecases/no_params.dart';
import 'package:market/domain/usecases/get_products_usecase.dart';
import 'package:market/domain/entities/product.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit({required this.getProductsUsecase})
      : super(const ProductListState());

  final GetProductsUsecase getProductsUsecase;

  void getProducts() async {
    if (state.status == ProductListStatus.loading) return;
    emit(state.copyWith(status: ProductListStatus.loading));
    final products = await getProductsUsecase(NoParams());
    products.fold(
      (failure) => emit(state.copyWith(status: ProductListStatus.error)),
      (fetchedProducts) {
        final List<Product> products = [...state.products, ...fetchedProducts];

        emit(state.copyWith(
          products: products,
          originalProducts: products,
          status: ProductListStatus.loaded,
        ));
      },
    );
  }

  void search(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(
          infiniteScroll: true, products: state.originalProducts));
      return;
    }
    emit(state.copyWith(infiniteScroll: false));
    final List<Product> products = state.originalProducts
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(state.copyWith(products: products));
  }

  void resetSearch() {
    emit(
        state.copyWith(infiniteScroll: true, products: state.originalProducts));
  }
}
