import 'product.dart';

/// Represents a single line item inside the cart: a product plus
/// how many units of it the user has added.
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get totalPrice => product.price * quantity;
}
