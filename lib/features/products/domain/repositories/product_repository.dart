import 'package:kartify/features/products/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProductsByCategory(String categoryId);
}
