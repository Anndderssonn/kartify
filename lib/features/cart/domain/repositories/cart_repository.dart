import 'package:kartify/features/cart/domain/entities/cart_item_entity.dart';
import 'package:kartify/features/products/products.dart';

abstract class CartRepository {
  List<CartItemEntity> getCartItems();
  void addToCart(ProductEntity product, int quantity);
  void removeFromCart(String productId);
  void updateQuantity(String productId, int quantity);
  void clearCart();
}
