import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kartify/features/main_navigation/bloc/navigation_bloc.dart';

class MainNavigationPage extends StatelessWidget {
  final Widget child;

  const MainNavigationPage({super.key, required this.child});

  int _locationToIndex(String location) {
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/categories')) return 1;
    if (location.startsWith('/cart')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final index = _locationToIndex(location);

    return BlocProvider(
      create: (_) => NavigationBloc(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          context.read<NavigationBloc>().add(
            NavigationTabChanged(tabIndex: index),
          );
          return Scaffold(
            body: child,
            bottomNavigationBar: NavigationBar(
              selectedIndex: state.tabIndex,
              onDestinationSelected: (index) {
                context.read<NavigationBloc>().add(
                  NavigationTabChanged(tabIndex: index),
                );
                switch (index) {
                  case 0:
                    context.go('/home');
                  case 1:
                    context.go('/categories');
                  case 2:
                    context.go('/cart');
                  case 3:
                    context.go('/profile');
                }
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.category_outlined),
                  selectedIcon: Icon(Icons.category),
                  label: 'Categories',
                ),
                NavigationDestination(
                  icon: Icon(Icons.shopping_cart_outlined),
                  selectedIcon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outlined),
                  selectedIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
