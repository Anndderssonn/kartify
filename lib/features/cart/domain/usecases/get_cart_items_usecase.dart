import 'package:kartify/features/cart/domain/entities/cart_item_entity.dart';
import 'package:kartify/features/cart/domain/repositories/cart_repository.dart';

class GetCartItemsUsecase {
  final CartRepository _repository;

  GetCartItemsUsecase({required CartRepository repository})
    : _repository = repository;

  List<CartItemEntity> call() {
    return _repository.getCartItems();
  }
}
