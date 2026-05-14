part of 'cart_bloc.dart';

class CartState {
  final List<CartItemEntity> items;

  const CartState({required this.items});

  double get totalPrice =>
      items.fold(0, (sum, item) => sum + (item.product.price * item.quantity));

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  bool get isEmpty => items.isEmpty;
}
