import 'models/product.dart';

class ProductsData {
  static List<Product> getSofas() {
    return [
      const Product(
        id: '1',
        name: 'Modern Sofa Set',
        price: 299.99,
        imageUrl:
            'assets/images/sofa1.jpg', 
        description:
            'Comfortable modern sofa perfect for your living room. Made with high-quality materials and elegant design.',
      ),
      const Product(
        id: '2',
        name: 'Classic Sofa',
        price: 199.99,
        imageUrl: 'assets/images/sofa2.png',
        description:
            'Classic design sofa with comfortable cushioning. Perfect for family gatherings and relaxation.',
      ),
      const Product(
        id: '3',
        name: 'Luxury Sofa',
        price: 499.99,
        imageUrl: 'assets/images/sofa3.png',
        description:
            'Premium luxury sofa with leather finish. Elegant and sophisticated for modern homes.',
      ),
      const Product(
        id: '4',
        name: 'Compact Sofa',
        price: 149.99,
        imageUrl: 'assets/images/sofa4.jpg',
        description:
            'Space-saving compact sofa ideal for small apartments. Comfortable and stylish.',
      ),
    ];
  }
}
