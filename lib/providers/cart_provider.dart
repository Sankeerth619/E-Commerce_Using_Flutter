import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};
  final List<String> _wishlist = [];

  Map<String, CartItem> get items => {..._items};

  List<CartItem> get cartItems => _items.values.toList();

  List<String> get wishlist => [..._wishlist];

  int get itemCount => _items.length;

  int get totalQuantity =>
      _items.values.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal =>
      _items.values.fold(0.0, (sum, item) => sum + item.totalPrice);

  double get deliveryCharge {
    if (subtotal >= 499) return 0.0;
    return 40.0;
  }

  double get discount =>
      _items.values.fold(
          0.0,
          (sum, item) =>
              sum + (item.product.originalPrice - item.product.price) * item.quantity);

  double get total => subtotal + deliveryCharge;

  bool isInCart(String productId) => _items.containsKey(productId);

  bool isInWishlist(String productId) => _wishlist.contains(productId);

  int getQuantity(String productId) => _items[productId]?.quantity ?? 0;

  void addToCart(Product product, {String? color, String? size}) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(
        product: product,
        quantity: 1,
        selectedColor: color,
        selectedSize: size,
      );
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void incrementQuantity(String productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!.quantity < 10) {
        _items[productId]!.quantity++;
        notifyListeners();
      }
    }
  }

  void decrementQuantity(String productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!.quantity > 1) {
        _items[productId]!.quantity--;
      } else {
        _items.remove(productId);
      }
      notifyListeners();
    }
  }

  void updateQuantity(String productId, int quantity) {
    if (quantity <= 0) {
      removeFromCart(productId);
    } else if (_items.containsKey(productId)) {
      _items[productId]!.quantity = quantity;
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  void toggleWishlist(String productId) {
    if (_wishlist.contains(productId)) {
      _wishlist.remove(productId);
    } else {
      _wishlist.add(productId);
    }
    notifyListeners();
  }
}
