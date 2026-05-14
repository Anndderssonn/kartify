import 'package:kartify/features/cart/domain/repositories/cart_repository.dart';

class RemoveFromCartUsecase {
  final CartRepository _repository;

  RemoveFromCartUsecase({required CartRepository repository})
    : _repository = repository;

  void call(String productId) {
    _repository.removeFromCart(productId);
  }
}
