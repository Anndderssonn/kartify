import 'package:kartify/features/products/data/datasources/product_remote_datasource.dart';
import 'package:kartify/features/products/domain/domain.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource _remoteDatasource;

  ProductRepositoryImpl({required ProductRemoteDatasource remoteDatasource})
    : _remoteDatasource = remoteDatasource;

  @override
  Future<List<ProductEntity>> getProductsByCategory(String categoryId) async {
    return await _remoteDatasource.getProductsByCategory(categoryId);
  }
}
