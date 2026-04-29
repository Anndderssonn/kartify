import 'package:kartify/features/categories/data/datasources/category_remote_datasource.dart';
import 'package:kartify/features/categories/data/models/category_model.dart';

class CategoryRemoteDatasourceImpl implements CategoryRemoteDatasource {
  final List<CategoryModel> _mockCategories = [
    CategoryModel(
      id: '1',
      name: 'Fruits & Vegetables',
      imageUrl:
          'https://images.unsplash.com/photo-1610832958506-aa56368176cf?w=400',
      itemCount: 120,
    ),
    CategoryModel(
      id: '2',
      name: 'Meat & Fish',
      imageUrl:
          'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?w=400',
      itemCount: 85,
    ),
    CategoryModel(
      id: '3',
      name: 'Dairy & Eggs',
      imageUrl:
          'https://images.unsplash.com/photo-1550583724-b2692b85b150?w=400',
      itemCount: 60,
    ),
    CategoryModel(
      id: '4',
      name: 'Bakery',
      imageUrl:
          'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400',
      itemCount: 45,
    ),
    CategoryModel(
      id: '5',
      name: 'Beverages',
      imageUrl:
          'https://images.unsplash.com/photo-1544145945-f90425340c7e?w=400',
      itemCount: 95,
    ),
    CategoryModel(
      id: '6',
      name: 'Snacks',
      imageUrl:
          'https://images.unsplash.com/photo-1621939514649-280e2ee25f60?w=400',
      itemCount: 110,
    ),
  ];

  @override
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return List.from(_mockCategories);
  }
}
