import 'package:kartify/features/products/products.dart';

class CartItemEntity {
  final ProductEntity product;
  final int quantity;

  const CartItemEntity({required this.product, required this.quantity});
}
