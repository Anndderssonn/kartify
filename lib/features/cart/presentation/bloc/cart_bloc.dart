import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartify/features/cart/domain/domain.dart';
import 'package:kartify/features/products/products.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItemsUsecase _getCartItemsUsecase;
  final AddToCartUsecase _addToCartUsecase;
  final RemoveFromCartUsecase _removeFromCartUsecase;
  final UpdateQuantityUsecase _updateQuantityUsecase;
  final ClearCartUsecase _clearCartUsecase;

  CartBloc({
    required GetCartItemsUsecase getCartItemsUsecase,
    required AddToCartUsecase addToCartUsecase,
    required RemoveFromCartUsecase removeFromCartUsecase,
    required UpdateQuantityUsecase updateQuantityUsecase,
    required ClearCartUsecase clearCartUsecase,
  }) : _getCartItemsUsecase = getCartItemsUsecase,
       _addToCartUsecase = addToCartUsecase,
       _removeFromCartUsecase = removeFromCartUsecase,
       _updateQuantityUsecase = updateQuantityUsecase,
       _clearCartUsecase = clearCartUsecase,
       super(const CartState(items: [])) {
    on<CartItemAdded>(_onItemAdded);
    on<CartItemRemoved>(_onItemRemoved);
    on<CartQuantityUpdated>(_onQuantityUpdated);
    on<CartCleared>(_onCartCleared);
  }

  void _onItemAdded(CartItemAdded event, Emitter<CartState> emit) {
    _addToCartUsecase(event.product, event.quantity);
    emit(CartState(items: _getCartItemsUsecase()));
  }

  void _onItemRemoved(CartItemRemoved event, Emitter<CartState> emit) {
    _removeFromCartUsecase(event.productId);
    emit(CartState(items: _getCartItemsUsecase()));
  }

  void _onQuantityUpdated(CartQuantityUpdated event, Emitter<CartState> emit) {
    _updateQuantityUsecase(event.productId, event.quantity);
    emit(CartState(items: _getCartItemsUsecase()));
  }

  void _onCartCleared(CartCleared event, Emitter<CartState> emit) {
    _clearCartUsecase();
    emit(CartState(items: _getCartItemsUsecase()));
  }
}
