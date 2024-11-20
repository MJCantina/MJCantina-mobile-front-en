class Product {
  final String category;
  final String description;
  final String imageUrl;
  final double price;
  final int stock;
  final String title;

  Product({
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.stock,
    required this.title,
  });

  factory Product.fromFirebase(Map<String, dynamic> data) {
    return Product(
      category: data['category'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      price: double.parse(data['price']),
      stock: int.parse(data['stock']),
      title: data['title'] ?? '',
    );
  }
}
