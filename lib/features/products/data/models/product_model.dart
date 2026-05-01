import 'package:kartify/features/products/domain/domain.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.categoryId,
    required super.name,
    required super.imageUrl,
    required super.price,
    required super.unit,
    required super.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      unit: json['unit'] as String,
      isFavorite: json['isFavorite'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'unit': unit,
      'isFavorite': isFavorite,
    };
  }
}
