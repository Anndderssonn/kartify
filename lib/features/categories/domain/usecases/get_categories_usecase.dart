import 'package:kartify/features/categories/domain/entities/category_entity.dart';
import 'package:kartify/features/categories/domain/repositories/category_repository.dart';

class GetCategoriesUsecase {
  final CategoryRepository _repository;

  GetCategoriesUsecase({required CategoryRepository repository})
    : _repository = repository;

  Future<List<CategoryEntity>> call() async {
    return await _repository.getCategories();
  }
}
