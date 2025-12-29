import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/product_model.dart';
import '../data/repository/product_repository.dart';

class ProductState {
  final List<Product> products;
  final String selectedCategory;

  const ProductState({
    required this.products,
    required this.selectedCategory,
  });

  ProductState copyWith({
    List<Product>? products,
    String? selectedCategory,
  }) {
    return ProductState(
      products: products ?? this.products,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

class ProductNotifier extends Notifier<ProductState> {
  late final ProductRepository _repository;

  @override
  ProductState build() {
    _repository = const ProductRepository();

    final products = _repository.getAllProducts();

    return ProductState(
      products: products,
      selectedCategory: "All",
    );
  }

  void filterByCategory(String category) {
    final filteredProducts = _repository.getProductsByCategory(category);

    state = state.copyWith(
      products: filteredProducts,
      selectedCategory: category,
    );
  }

  void toggleFavorite(int productId) {
    final updatedProducts = state.products.map((product) {
      if (product.id == productId) {
        return product.copyWith(isFavorite: !product.isFavorite);
      }
      return product;
    }).toList();

    state = state.copyWith(products: updatedProducts);
  }
}

final productProvider =
    NotifierProvider<ProductNotifier, ProductState>(
  ProductNotifier.new,
);
