import 'package:kartify/features/products/domain/entities/product_entity.dart';
import 'package:kartify/features/products/domain/repositories/product_repository.dart';

class GetAllProductsUsecase {
  final ProductRepository _repository;

  GetAllProductsUsecase({required ProductRepository repository})
    : _repository = repository;

  Future<List<ProductEntity>> call() async {
    return await _repository.getAllProducts();
  }
}
