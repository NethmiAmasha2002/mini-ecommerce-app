/// Represents a single product in the store.
///
/// Using a plain Dart class (not a database/network model) since the
/// app works entirely with local mock data, as required by the task.
class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double rating;
  final String description;
  final String category;

  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.description,
    required this.category,
  });

  /// Creates a [Product] from a JSON map.
  /// Kept here so swapping mock data for a real API later only
  /// requires changing where this is called from, not the model itself.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      description: json['description'] as String,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'rating': rating,
      'description': description,
      'category': category,
    };
  }
}
