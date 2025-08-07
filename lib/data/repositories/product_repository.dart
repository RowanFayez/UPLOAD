import 'package:injectable/injectable.dart';
import '../datasources/product_api.dart';
import '../models/product.dart';

@injectable
class ProductRepository {
  final ProductApi _productApi;

  ProductRepository(this._productApi);

  Future<List<Product>> getProducts() async {
    try {
      return await _productApi.getProducts();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  Future<List<String>> getCategories() async {
    try {
      return await _productApi.getCategories();
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      return await _productApi.getProductsByCategory(category);
    } catch (e) {
      throw Exception('Failed to fetch products by category: $e');
    }
  }
}
