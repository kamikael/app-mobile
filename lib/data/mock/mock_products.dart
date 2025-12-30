import '../models/product_model.dart';

List<Product> getMockProducts() {
  return [
    Product(
      id: '1',
      name: 'Radiance',
      price: 140,
      imageUrl: 'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=400&h=400&fit=crop',
      category: 'all',
    ),
    Product(
      id: '2',
      name: 'Greending',
      price: 150,
      imageUrl: 'https://images.unsplash.com/photo-1556228720-195a672e8a03?w=400&h=400&fit=crop',
      category: 'all',
    ),
    Product(
      id: '3',
      name: 'Sensitive Oil',
      price: 165,
      imageUrl: 'https://images.unsplash.com/photo-1608248543803-ba4f8c70ae0b?w=400&h=400&fit=crop',
      category: 'women',
    ),
    Product(
      id: '4',
      name: 'Essence Plus',
      price: 180,
      imageUrl: 'https://images.unsplash.com/photo-1556228994-05e4c0fbdfa4?w=400&h=400&fit=crop',
      category: 'men',
    ),
    Product(
      id: '5',
      name: 'Hydra Boost',
      price: 195,
      imageUrl: 'https://images.unsplash.com/photo-1570554886111-e80fcca6a029?w=400&h=400&fit=crop',
      category: 'all',
    ),
    Product(
      id: '6',
      name: 'Pure Glow',
      price: 155,
      imageUrl: 'https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop',
      category: 'women',
    ),
  ];
}
