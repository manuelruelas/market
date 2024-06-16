part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    this.product,
    this.status = ProductDetailStatus.loading,
  });

  final Product? product;
  final ProductDetailStatus status;

  @override
  List<Object> get props => [status];

  ProductDetailState copyWith({
    Product? product,
    ProductDetailStatus? status,
  }) {
    return ProductDetailState(
      product: product ?? this.product,
      status: status ?? this.status,
    );
  }
}

enum ProductDetailStatus { initial, loading, loaded, error }
