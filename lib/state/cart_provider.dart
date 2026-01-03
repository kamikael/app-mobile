import 'package:flutter/foundation.dart';

class CartItem {
  final int productId;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.productId,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class CartProvider with ChangeNotifier {
  final Map<int, CartItem> _items = {};

  //  Getters
  Map<int, CartItem> get items => {..._items};

  int get itemCount {
    return _items.values.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalAmount {
    return _items.values.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  //  Ajouter un produit
  void addToCart({
    required int productId,
    required String name,
    required double price,
  }) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity += 1;
    } else {
      _items[productId] = CartItem(
        productId: productId,
        name: name,
        price: price,
      );
    }
    notifyListeners();
  }

  //  Retirer complètement un produit
  void removeFromCart(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  //  Augmenter quantité
  void increaseQuantity(int productId) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity += 1;
      notifyListeners();
    }
  }

  //  Diminuer quantité
  void decreaseQuantity(int productId) {
    if (!_items.containsKey(productId)) return;

    if (_items[productId]!.quantity > 1) {
      _items[productId]!.quantity -= 1;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  //  Vider le panier
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
  //  Vérifier si un produit est dans le panier
  bool isInCart(int productId) {
  return _items.containsKey(productId);
}

}
