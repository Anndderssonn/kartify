import 'package:kartify/features/cart/domain/repositories/cart_repository.dart';

class UpdateQuantityUsecase {
  final CartRepository _repository;

  UpdateQuantityUsecase({required CartRepository repository})
    : _repository = repository;

  void call(String productId, int quantity) {
    _repository.updateQuantity(productId, quantity);
  }
}
