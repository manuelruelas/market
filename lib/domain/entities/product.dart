class Product {
  String id;
  String name;
  String? description;
  double price;
  String category;
  int rating;
  List<String>? imageUrls;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.rating,
    this.imageUrls = const [],
  });
}
