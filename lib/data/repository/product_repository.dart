import '../mock/mock_products.dart';
import '../models/product_model.dart';

class ProductRepository {
  const ProductRepository();

  List<Product> getAllProducts() {
    return mockProducts;
  }

  List<Product> getProductsByCategory(String category) {
    if (category == "All") {
      return mockProducts;
    }

    return mockProducts
        .where((product) => product.category == category)
        .toList();
  }
}
