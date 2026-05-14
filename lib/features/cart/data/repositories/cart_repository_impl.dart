import 'package:kartify/features/cart/domain/entities/cart_item_entity.dart';
import 'package:kartify/features/cart/domain/repositories/cart_repository.dart';
import 'package:kartify/features/products/products.dart';

class CartRepositoryImpl implements CartRepository {
  final List<CartItemEntity> _items = [];

  @override
  List<CartItemEntity> getCartItems() => List.from(_items);

  @override
  void addToCart(ProductEntity product, int quantity) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index] = CartItemEntity(
        product: _items[index].product,
        quantity: _items[index].quantity + quantity,
      );
    } else {
      _items.add(CartItemEntity(product: product, quantity: quantity));
    }
  }

  @override
  void removeFromCart(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
  }

  @override
  void updateQuantity(String productId, int quantity) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _items[index] = CartItemEntity(
        product: _items[index].product,
        quantity: quantity,
      );
    }
  }

  @override
  void clearCart() => _items.clear();
}
