import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

/// Holds and manages the state of the shopping cart.
///
/// Every method that changes the cart calls [notifyListeners] so that
/// any widget listening via Provider/Consumer rebuilds automatically.
/// The cart is stored as a Map keyed by product id so add/remove/update
/// operations are O(1) instead of scanning a list every time.
class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  /// Read-only view of the cart items for the UI to render.
  Map<String, CartItem> get items => Map.unmodifiable(_items);

  List<CartItem> get itemList => _items.values.toList();

  int get totalItemCount {
    return _items.values.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalPrice {
    return _items.values.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  bool get isEmpty => _items.isEmpty;

  bool isInCart(String productId) => _items.containsKey(productId);

  int quantityOf(String productId) => _items[productId]?.quantity ?? 0;

  /// Adds a product to the cart. If it's already there, increases the
  /// quantity instead of creating a duplicate line item.
  void addToCart(Product product, {int quantity = 1}) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += quantity;
    } else {
      _items[product.id] = CartItem(product: product, quantity: quantity);
    }
    notifyListeners();
  }

  void increaseQuantity(String productId) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity++;
      notifyListeners();
    }
  }

  /// Decreases quantity, but removes the item entirely once it would
  /// drop to zero so the cart never shows a "0 x Product" row.
  void decreaseQuantity(String productId) {
    if (!_items.containsKey(productId)) return;

    if (_items[productId]!.quantity > 1) {
      _items[productId]!.quantity--;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
