import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartify/core/core.dart';
import 'package:kartify/features/categories/categories.dart';
import 'package:kartify/features/home/presentation/widgets/home_categories_section.dart';
import 'package:kartify/features/home/presentation/widgets/home_featured_section.dart';
import 'package:kartify/features/home/presentation/widgets/home_header.dart';
import 'package:kartify/features/products/products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CategoryBloc>()..add(CategoryLoadRequested()),
        ),
        BlocProvider(
          create: (_) =>
              getIt<ProductBloc>()..add(ProductLoadRequested(categoryId: '1')),
        ),
      ],
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HomeHeader(
                username: 'Bruce Banner',
                onSearch: (query) {},
                bannerEmoji: '🥑',
                bannerTitle: 'Fresh Avocado',
                bannerSubtitle: '20% off today',
                bannerButtonLabel: 'Buy',
                onBannerTap: () {},
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 58)),
            const SliverToBoxAdapter(child: HomeCategoriesSection()),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(child: HomeFeaturedSection()),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}
