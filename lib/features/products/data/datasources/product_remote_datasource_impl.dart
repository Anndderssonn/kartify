import 'package:kartify/features/products/data/datasources/product_remote_datasource.dart';
import 'package:kartify/features/products/data/models/product_model.dart';

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final List<ProductModel> _mockProducts = [
    ProductModel(
      id: '1',
      categoryId: '1',
      name: 'Red Apple',
      imageUrl:
          'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=400',
      price: 2.99,
      unit: '1kg',
      isFavorite: false,
    ),
    ProductModel(
      id: '2',
      categoryId: '1',
      name: 'Broccoli',
      imageUrl:
          'https://images.unsplash.com/photo-1584270354949-c26b0d5b4a0c?w=400',
      price: 1.49,
      unit: '500g',
      isFavorite: true,
    ),
    ProductModel(
      id: '3',
      categoryId: '1',
      name: 'Lemon',
      imageUrl:
          'https://images.unsplash.com/photo-1590502593747-42a996133562?w=400',
      price: 0.99,
      unit: '500g',
      isFavorite: false,
    ),
    ProductModel(
      id: '4',
      categoryId: '1',
      name: 'Banana',
      imageUrl:
          'https://images.unsplash.com/photo-1603833665858-e61d17a86224?w=400',
      price: 1.29,
      unit: '1kg',
      isFavorite: false,
    ),
    ProductModel(
      id: '5',
      categoryId: '1',
      name: 'Strawberry',
      imageUrl:
          'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=400',
      price: 3.49,
      unit: '250g',
      isFavorite: true,
    ),
    ProductModel(
      id: '6',
      categoryId: '1',
      name: 'Avocado',
      imageUrl:
          'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=400',
      price: 1.99,
      unit: 'unit',
      isFavorite: false,
    ),
    ProductModel(
      id: '7',
      categoryId: '2',
      name: 'Chicken Breast',
      imageUrl:
          'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=400',
      price: 5.99,
      unit: '1kg',
      isFavorite: false,
    ),
    ProductModel(
      id: '8',
      categoryId: '2',
      name: 'Salmon Fillet',
      imageUrl:
          'https://images.unsplash.com/photo-1574781330855-d0db8cc6a79c?w=400',
      price: 8.99,
      unit: '500g',
      isFavorite: true,
    ),
  ];

  @override
  Future<List<ProductModel>> getProductsByCategory(String categoryId) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockProducts.where((p) => p.categoryId == categoryId).toList();
  }
}
