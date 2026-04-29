import 'package:kartify/features/categories/domain/domain.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.itemCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      itemCount: json['itemCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'itemCount': itemCount,
    };
  }
}
