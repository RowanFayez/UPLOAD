import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../data/models/cart.dart';
import '../../../../data/repositories/cart_repository.dart';

@injectable
class CartController extends ChangeNotifier {
  final CartRepository _cartRepository;

  CartController(this._cartRepository);

  Cart? _currentCart;
  bool _isLoading = false;
  String? _error;

  Cart? get currentCart => _currentCart;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadCart(int cartId) async {
    _setLoading(true);
    _error = null;

    try {
      final cart = await _cartRepository.getCart(cartId);
      _currentCart = await _cartRepository.populateCartWithProducts(cart);
    } catch (e) {
      _error = e.toString();
      _currentCart = null;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateProductQuantity(int productId, int newQuantity) async {
    if (_currentCart == null) return;

    try {
      final updatedProducts = _currentCart!.products.map((cartProduct) {
        if (cartProduct.productId == productId) {
          return CartProduct(
            productId: cartProduct.productId,
            quantity: newQuantity,
          )
            ..product = cartProduct.product
            ..size = cartProduct.size;
        }
        return cartProduct;
      }).toList();

      final updatedCart = Cart(
        id: _currentCart!.id,
        userId: _currentCart!.userId,
        date: _currentCart!.date,
        products: updatedProducts,
      );

      await _cartRepository.updateCart(_currentCart!.id, updatedCart.toJson());
      _currentCart = updatedCart;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> removeProduct(int productId) async {
    if (_currentCart == null) return;

    try {
      final updatedProducts = _currentCart!.products
          .where((cartProduct) => cartProduct.productId != productId)
          .toList();

      final updatedCart = Cart(
        id: _currentCart!.id,
        userId: _currentCart!.userId,
        date: _currentCart!.date,
        products: updatedProducts,
      );

      await _cartRepository.updateCart(_currentCart!.id, updatedCart.toJson());
      _currentCart = updatedCart;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void retry() {
    if (_currentCart != null) {
      loadCart(_currentCart!.id);
    }
  }
}
