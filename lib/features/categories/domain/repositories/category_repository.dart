import 'package:kartify/features/categories/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategories();
}
