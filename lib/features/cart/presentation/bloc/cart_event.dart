part of 'cart_bloc.dart';

sealed class CartEvent {}

final class CartItemAdded extends CartEvent {
  final ProductEntity product;
  final int quantity;
  CartItemAdded({required this.product, required this.quantity});
}

final class CartItemRemoved extends CartEvent {
  final String productId;
  CartItemRemoved({required this.productId});
}

final class CartQuantityUpdated extends CartEvent {
  final String productId;
  final int quantity;
  CartQuantityUpdated({required this.productId, required this.quantity});
}

final class CartCleared extends CartEvent {}
