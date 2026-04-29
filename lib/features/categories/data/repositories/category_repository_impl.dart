import 'package:kartify/features/categories/data/datasources/category_remote_datasource.dart';
import 'package:kartify/features/categories/domain/domain.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDatasource _remoteDatasource;

  CategoryRepositoryImpl({required CategoryRemoteDatasource remoteDatasource})
    : _remoteDatasource = remoteDatasource;

  @override
  Future<List<CategoryEntity>> getCategories() async {
    return await _remoteDatasource.getCategories();
  }
}
