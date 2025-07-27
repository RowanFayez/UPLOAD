import 'models/product.dart';

class ProductsData {
  static List<Product> getAllProducts() {
    return [
      const Product(
        id: '1',
        name: 'Soft Element Jack',
        price: 57.50,
        imageUrl:
            'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
        category: 'Chairs',
        rating: 4.5,
        reviewCount: 128,
        description:
            'A comfortable and stylish chair with soft cushioning and elegant design. Perfect for modern living spaces with its minimalist aesthetic and premium materials.',
        availableColors: ['Black', 'Gray', 'Beige'],
        galleryImages: [
          'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
          'https://images.unsplash.com/photo-1506439773649-6e0eb8cfb237?w=400',
        ],
      ),
      const Product(
        id: '2',
        name: 'Leset Galant',
        price: 94.00,
        imageUrl:
            'https://images.unsplash.com/photo-1549497538-303791108f95?w=400',
        category: 'Chairs',
        rating: 4.8,
        reviewCount: 145,
        description:
            'The inspiration for the design of this chair comes from the industrial style of the first half of the last century, which is complemented by the most modern materials and technologies.',
        availableColors: ['Blue', 'Green'],
        galleryImages: [
          'https://images.unsplash.com/photo-1549497538-303791108f95?w=400',
          'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=400',
        ],
      ),
      const Product(
        id: '3',
        name: 'Chester Chair',
        price: 51.00,
        imageUrl:
            'https://images.unsplash.com/photo-1506439773649-6e0eb8cfb237?w=400',
        category: 'Chairs',
        rating: 4.3,
        reviewCount: 89,
        description:
            'Classic Chester design with modern comfort features. Features tufted upholstery and sturdy construction for long-lasting durability.',
        availableColors: ['Gray', 'Black'],
        galleryImages: [
          'https://images.unsplash.com/photo-1506439773649-6e0eb8cfb237?w=400',
          'https://images.unsplash.com/photo-1549497538-303791108f95?w=400',
        ],
      ),
      const Product(
        id: '4',
        name: 'Avrora Chair',
        price: 75.50,
        imageUrl:
            'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=400',
        category: 'Chairs',
        rating: 4.6,
        reviewCount: 201,
        description:
            'Bright and cheerful chair that adds a pop of color to any room. Comfortable seating with contemporary styling.',
        availableColors: ['Yellow', 'Green', 'Blue'],
        galleryImages: [
          'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=400',
          'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
        ],
      ),
      const Product(
        id: '5',
        name: 'Modern Sofa Set',
        price: 299.99,
        imageUrl:
            'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400',
        category: 'Sofas',
        rating: 4.7,
        reviewCount: 156,
        description:
            'Luxurious 3-seater sofa with premium fabric upholstery and ergonomic design for maximum comfort.',
        availableColors: ['Beige', 'Gray', 'Navy'],
        galleryImages: [
          'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400',
          'https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?w=400',
        ],
      ),
      const Product(
        id: '6',
        name: 'Dining Table Oak',
        price: 189.00,
        imageUrl:
            'https://images.unsplash.com/photo-1549497538-303791108f95?w=400',
        category: 'Tables',
        rating: 4.4,
        reviewCount: 73,
        description:
            'Solid oak dining table with natural wood finish. Perfect for family gatherings and dinner parties.',
        availableColors: ['Natural Oak', 'Dark Oak'],
        galleryImages: [
          'https://images.unsplash.com/photo-1549497538-303791108f95?w=400',
          'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
        ],
      ),
    ];
  }

  static List<String> getCategories() {
    return ['Sofas', 'Chairs', 'Tables', 'Kitchen'];
  }

  static List<Product> getProductsByCategory(String category) {
    return getAllProducts()
        .where((product) => product.category == category)
        .toList();
  }

  static Product? getProductById(String id) {
    try {
      return getAllProducts().firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}
