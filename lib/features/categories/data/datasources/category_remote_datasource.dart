import 'package:kartify/features/categories/data/models/category_model.dart';

abstract class CategoryRemoteDatasource {
  Future<List<CategoryModel>> getCategories();
}
