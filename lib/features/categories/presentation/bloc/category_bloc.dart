import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartify/features/categories/domain/domain.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesUsecase _getCategoriesUsecase;

  CategoryBloc({required GetCategoriesUsecase getCategoriesUsecase})
    : _getCategoriesUsecase = getCategoriesUsecase,
      super(CategoryInitial()) {
    on<CategoryLoadRequested>(_onLoadRequested);
  }

  Future<void> _onLoadRequested(
    CategoryLoadRequested event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    try {
      final categories = await _getCategoriesUsecase();
      emit(CategoryLoaded(categories: categories));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}
