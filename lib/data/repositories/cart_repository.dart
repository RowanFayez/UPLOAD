import 'package:injectable/injectable.dart';
import '../datasources/product_api.dart';
import '../models/cart.dart';
import '../models/product.dart';

@injectable
class CartRepository {
  final ProductApi _productApi;

  CartRepository(this._productApi);

  Future<List<Cart>> getCarts() async {
    try {
      return await _productApi.getCarts();
    } catch (e) {
      throw Exception('Failed to fetch carts: $e');
    }
  }

  Future<Cart> getCart(int id) async {
    try {
      return await _productApi.getCart(id);
    } catch (e) {
      throw Exception('Failed to fetch cart: $e');
    }
  }

  Future<Cart> createCart(Map<String, dynamic> cartData) async {
    try {
      return await _productApi.createCart(cartData);
    } catch (e) {
      throw Exception('Failed to create cart: $e');
    }
  }

  Future<Cart> updateCart(int id, Map<String, dynamic> cartData) async {
    try {
      return await _productApi.updateCart(id, cartData);
    } catch (e) {
      throw Exception('Failed to update cart: $e');
    }
  }

  Future<Cart> deleteCart(int id) async {
    try {
      return await _productApi.deleteCart(id);
    } catch (e) {
      throw Exception('Failed to delete cart: $e');
    }
  }

  // Helper method to populate cart products with full product details
  Future<Cart> populateCartWithProducts(Cart cart) async {
    try {
      final List<CartProduct> populatedProducts = [];
      
      for (final cartProduct in cart.products) {
        // Fetch product details for each cart product
        final products = await _productApi.getProducts();
        final product = products.firstWhere(
          (p) => p.id == cartProduct.productId,
          orElse: () => throw Exception('Product not found'),
        );
        
        final populatedCartProduct = CartProduct(
          productId: cartProduct.productId,
          quantity: cartProduct.quantity,
        );
        populatedCartProduct.product = product;
        populatedCartProduct.size = 'M'; // Default size, could be made dynamic
        
        populatedProducts.add(populatedCartProduct);
      }
      
      return Cart(
        id: cart.id,
        userId: cart.userId,
        date: cart.date,
        products: populatedProducts,
      );
    } catch (e) {
      throw Exception('Failed to populate cart with products: $e');
    }
  }
}