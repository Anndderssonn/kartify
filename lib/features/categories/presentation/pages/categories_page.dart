import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kartify/features/categories/domain/domain.dart';
import 'package:kartify/features/categories/presentation/bloc/category_bloc.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CategoryError) {
            return Center(child: Text(state.message));
          }
          if (state is CategoryLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return _CategoryCard(category: state.categories[index]);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final CategoryEntity category;

  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.outlineVariant),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: category.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: colorScheme.primaryContainer,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: colorScheme.primaryContainer,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: colorScheme.primaryContainer,
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onPrimaryContainer,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${category.itemCount} items',
                    style: TextStyle(
                      fontSize: 11,
                      color: colorScheme.onPrimaryContainer.withValues(
                        alpha: 0.7,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
