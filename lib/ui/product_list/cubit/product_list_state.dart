part of 'product_list_cubit.dart';

class ProductListState extends Equatable {
  const ProductListState({
    this.products = const [],
    this.status = ProductListStatus.initial,
    this.originalProducts = const [],
    this.infiniteScroll = true,
  });

  final List<Product> products;
  final ProductListStatus status;
  final List<Product> originalProducts;
  final bool infiniteScroll;
  @override
  List<Object> get props =>
      [products, status, originalProducts, infiniteScroll];

  ProductListState copyWith({
    List<Product>? products,
    ProductListStatus? status,
    List<Product>? originalProducts,
    bool? infiniteScroll,
  }) {
    return ProductListState(
      products: products ?? this.products,
      status: status ?? this.status,
      originalProducts: originalProducts ?? this.originalProducts,
      infiniteScroll: infiniteScroll ?? this.infiniteScroll,
    );
  }
}

enum ProductListStatus { initial, loading, loaded, error }
