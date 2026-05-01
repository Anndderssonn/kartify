import 'package:kartify/features/products/domain/entities/product_entity.dart';
import 'package:kartify/features/products/domain/repositories/product_repository.dart';

class GetProductsByCategoryUsecase {
  final ProductRepository _repository;

  GetProductsByCategoryUsecase({required ProductRepository repository})
    : _repository = repository;

  Future<List<ProductEntity>> call(String categoryId) async {
    return await _repository.getProductsByCategory(categoryId);
  }
}
