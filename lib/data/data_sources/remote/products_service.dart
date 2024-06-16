import 'package:market/core/networking/api_client.dart';
import 'package:market/data/models/product_model.dart';

class ProductsService {
  final ApiClient client;

  ProductsService({required this.client});

  Future<List<ProductModel>> getProducts({limit = 5, offset = 0}) async {
    final response = await client.get('/products');
    final products = response.data as List;
    return products.map((product) => ProductModel.fromJson(product)).toList();
  }
}
