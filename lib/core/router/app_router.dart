import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kartify/core/core.dart';
import 'package:kartify/features/features.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainNavigationPage(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const Placeholder(),
        ),
        GoRoute(
          path: '/categories',
          builder: (context, state) => const Placeholder(),
        ),
        GoRoute(
          path: '/cart',
          builder: (context, state) => const Placeholder(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),
    GoRoute(
      path: '/address',
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<AddressBloc>()..add(AddressLoadRequested()),
        child: const AddressListPage(),
      ),
    ),
  ],
);
