import '../models/product.dart';

class ProductDataSource {
  static List<Product> getAllProducts() {
    return [
      ...getSofas(),
      ...getChairs(),
      ...getTables(),
    ];
  }

  static List<Product> getSofas() {
    return [
      const Product(
        id: '1',
        name: 'Modern Sofa Set',
        price: 299.99,
        imageUrl: 'assets/images/sofa1.jpg',
        description: 'Comfortable modern sofa perfect for your living room. Made with high-quality materials and elegant design.',
        category: 'Sofas',
        rating: 4.5,
        reviewCount: 128,
      ),
      const Product(
        id: '2',
        name: 'Classic Sofa',
        price: 199.99,
        imageUrl: 'assets/images/sofa2.png',
        description: 'Classic design sofa with comfortable cushioning. Perfect for family gatherings and relaxation.',
        category: 'Sofas',
        rating: 4.2,
        reviewCount: 89,
      ),
      const Product(
        id: '3',
        name: 'Luxury Sofa',
        price: 499.99,
        imageUrl: 'assets/images/sofa3.png',
        description: 'Premium luxury sofa with leather finish. Elegant and sophisticated for modern homes.',
        category: 'Sofas',
        rating: 4.8,
        reviewCount: 156,
      ),
      const Product(
        id: '4',
        name: 'Compact Sofa',
        price: 149.99,
        imageUrl: 'assets/images/sofa4.jpg',
        description: 'Space-saving compact sofa ideal for small apartments. Comfortable and stylish.',
        category: 'Sofas',
        rating: 4.0,
        reviewCount: 67,
      ),
    ];
  }

  static List<Product> getChairs() {
    return [
      const Product(
        id: '5',
        name: 'Office Chair',
        price: 89.99,
        imageUrl: 'assets/images/sofa1.jpg', // Placeholder
        description: 'Ergonomic office chair with lumbar support.',
        category: 'Chairs',
        rating: 4.3,
        reviewCount: 45,
      ),
    ];
  }

  static List<Product> getTables() {
    return [
      const Product(
        id: '6',
        name: 'Coffee Table',
        price: 129.99,
        imageUrl: 'assets/images/sofa1.jpg', // Placeholder
        description: 'Modern coffee table with storage compartments.',
        category: 'Tables',
        rating: 4.1,
        reviewCount: 32,
      ),
    ];
  }

  static List<String> getCategories() {
    return ['Sofas', 'Chairs', 'Tables'];
  }
}