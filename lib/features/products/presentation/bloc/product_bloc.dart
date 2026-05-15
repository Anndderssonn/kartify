import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartify/features/products/domain/domain.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductsUsecase _getAllProductsUsecase;
  final GetProductsByCategoryUsecase _getProductsByCategoryUsecase;

  ProductBloc({
    required GetAllProductsUsecase getAllProductsUsecase,
    required GetProductsByCategoryUsecase getProductsByCategoryUsecase,
  }) : _getAllProductsUsecase = getAllProductsUsecase,
       _getProductsByCategoryUsecase = getProductsByCategoryUsecase,
       super(ProductInitial()) {
    on<AllProductsLoadRequested>(_onAllProductsLoadRequested);
    on<ProductLoadRequested>(_onLoadRequested);
  }

  Future<void> _onAllProductsLoadRequested(
    AllProductsLoadRequested event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final products = await _getAllProductsUsecase();
      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  Future<void> _onLoadRequested(
    ProductLoadRequested event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final products = await _getProductsByCategoryUsecase(event.categoryId);
      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
