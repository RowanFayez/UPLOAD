import '../models/product.dart';
import '../products_data.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<List<Product>> getProductsByCategory(String category);
  Future<Product?> getProductById(String id);
  Future<List<String>> getCategories();
}

class LocalProductRepository implements ProductRepository {
  @override
  Future<List<Product>> getAllProducts() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return ProductsData.getAllProducts();
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final allProducts = ProductsData.getAllProducts();
    return allProducts.where((product) => product.category == category).toList();
  }

  @override
  Future<Product?> getProductById(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final allProducts = ProductsData.getAllProducts();
    try {
      return allProducts.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<String>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return ProductsData.getCategories();
  }
}