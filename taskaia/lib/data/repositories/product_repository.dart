import 'package:injectable/injectable.dart';
import '../models/product.dart';
import '../datasources/api_client.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<List<Product>> getProductsByCategory(String category);
  Future<Product> getProductById(int id);
  Future<List<String>> getCategories();
}

@Injectable(as: ProductRepository)
class ApiProductRepository implements ProductRepository {
  final ApiClient _apiClient;

  ApiProductRepository(this._apiClient);

  @override
  Future<List<Product>> getAllProducts() async {
    try {
      return await _apiClient.getProducts();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      return await _apiClient.getProductsByCategory(category);
    } catch (e) {
      throw Exception('Failed to fetch products by category: $e');
    }
  }

  @override
  Future<Product> getProductById(int id) async {
    try {
      return await _apiClient.getProduct(id);
    } catch (e) {
      throw Exception('Failed to fetch product: $e');
    }
  }

  @override
  Future<List<String>> getCategories() async {
    try {
      return await _apiClient.getCategories();
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }
}