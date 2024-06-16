import 'package:market/domain/entities/product.dart';

class ProductModel {
  String id;
  String name;
  String? description;
  double price;
  String category;
  int rating;

  ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.category,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"].toDouble(),
        category: json["category"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "category": category,
        "rating": rating,
      };
  Product toEntity() => Product(
        id: id,
        name: name,
        description: description,
        price: price,
        category: category,
        rating: rating,
      );
}
