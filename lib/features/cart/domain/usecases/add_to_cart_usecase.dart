import 'package:kartify/features/cart/domain/repositories/cart_repository.dart';
import 'package:kartify/features/products/products.dart';

class AddToCartUsecase {
  final CartRepository _repository;

  AddToCartUsecase({required CartRepository repository})
    : _repository = repository;

  void call(ProductEntity product, int quantity) {
    _repository.addToCart(product, quantity);
  }
}
