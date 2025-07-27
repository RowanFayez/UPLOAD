class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final double rating;
  final int reviewCount;
  final String description;
  final List<String> availableColors;
  final List<String> galleryImages;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.availableColors,
    required this.galleryImages,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      category: json['category'],
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      description: json['description'],
      availableColors: List<String>.from(json['availableColors']),
      galleryImages: List<String>.from(json['galleryImages']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
      'rating': rating,
      'reviewCount': reviewCount,
      'description': description,
      'availableColors': availableColors,
      'galleryImages': galleryImages,
    };
  }
}
