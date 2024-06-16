part of 'product_list_cubit.dart';

class ProductListState extends Equatable {
  const ProductListState({
    this.products = const [],
    this.status = ProductListStatus.initial,
    this.filteredProducts = const [],
  });

  final List<Product> products;
  final ProductListStatus status;
  final List<Product> filteredProducts;

  @override
  List<Object> get props => [products, status, filteredProducts];

  ProductListState copyWith({
    List<Product>? products,
    List<Product>? filteredProducts,
    ProductListStatus? status,
  }) {
    return ProductListState(
      products: products ?? this.products,
      status: status ?? this.status,
      filteredProducts: filteredProducts ?? this.filteredProducts,
    );
  }
}

enum ProductListStatus { initial, loading, loaded, error }
