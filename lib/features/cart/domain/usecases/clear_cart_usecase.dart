import 'package:kartify/features/cart/domain/repositories/cart_repository.dart';

class ClearCartUsecase {
  final CartRepository _repository;

  ClearCartUsecase({required CartRepository repository})
    : _repository = repository;

  void call() {
    _repository.clearCart();
  }
}
