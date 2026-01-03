class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final String category;
  final String description;
  final bool isFavorite;

  const Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    required this.description,
    this.isFavorite = false,
  });

  Product copyWith({
    bool? isFavorite,
  }) {
    return Product(
      id: id,
      name: name,
      image: image,
      price: price,
      category: category,
      description: description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
