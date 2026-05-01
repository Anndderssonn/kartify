import 'package:kartify/features/products/data/models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> getProductsByCategory(String categoryId);
}
