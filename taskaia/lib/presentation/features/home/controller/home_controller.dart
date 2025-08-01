import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../data/models/product.dart';
import '../../../../data/repositories/product_repository.dart';

@injectable
class HomeController extends ChangeNotifier {
  final ProductRepository _productRepository;

  HomeController(this._productRepository);

  List<Product> _products = [];
  List<String> _categories = [];
  String _selectedCategory = 'all';
  bool _isLoading = false;
  String? _error;

  List<Product> get products => _products;
  List<String> get categories => _categories;
  String get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadProducts() async {
    _setLoading(true);
    _error = null;
    
    try {
      if (_selectedCategory == 'all') {
        _products = await _productRepository.getAllProducts();
      } else {
        _products = await _productRepository.getProductsByCategory(_selectedCategory);
      }
    } catch (e) {
      _error = e.toString();
      _products = [];
    } finally {
      _setLoading(false);
    }
  }

  Future<void> loadCategories() async {
    try {
      final categories = await _productRepository.getCategories();
      _categories = ['all', ...categories];
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  void selectCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      notifyListeners();
      loadProducts();
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void retry() {
    loadProducts();
  }
}