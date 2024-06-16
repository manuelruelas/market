part of 'product_list_cubit.dart';

class ProductListState extends Equatable {
  const ProductListState(
      {this.products = const [], this.status = ProductListStatus.initial});

  final List<Product> products;
  final ProductListStatus status;

  @override
  List<Object> get props => [products, status];

  ProductListState copyWith({
    List<Product>? products,
    ProductListStatus? status,
  }) {
    return ProductListState(
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }
}

enum ProductListStatus { initial, loading, loaded, error }
