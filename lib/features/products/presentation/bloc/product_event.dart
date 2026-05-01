part of 'product_bloc.dart';

sealed class ProductEvent {}

final class ProductLoadRequested extends ProductEvent {
  final String categoryId;
  ProductLoadRequested({required this.categoryId});
}
