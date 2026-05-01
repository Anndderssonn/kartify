class ProductEntity {
  final String id;
  final String categoryId;
  final String name;
  final String imageUrl;
  final double price;
  final String unit;
  final bool isFavorite;

  const ProductEntity({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.unit,
    required this.isFavorite,
  });
}
