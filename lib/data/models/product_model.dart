import 'package:market/domain/entities/product.dart';

class ProductModel {
  String id;
  String name;
  String? description;
  double price;
  String category;
  int rating;
  List<String>? imageUrls;

  ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.category,
    required this.rating,
    this.imageUrls,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"].toDouble(),
        category: json["category"],
        rating: json["rating"],
        imageUrls: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "category": category,
        "rating": rating,
        "images": List<dynamic>.from(imageUrls!.map((x) => x)),
      };
  Product toEntity() => Product(
        id: id,
        name: name,
        description: description,
        price: price,
        category: category,
        rating: rating,
        imageUrls: imageUrls,
      );
}
