import 'package:flutter/material.dart';
import 'package:kartify/features/profile/presentation/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProfileHeader(
              username: 'Bruce Banner',
              email: 'bruce.banner@email.com',
            ),
          ),
          SliverToBoxAdapter(child: _SectionLabel(label: 'Account')),
          SliverToBoxAdapter(
            child: ProfileMenuItem(
              icon: Icons.location_on_outlined,
              title: 'Address',
              subtitle: 'Manage your address',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: ProfileMenuItem(
              icon: Icons.shopping_bag_outlined,
              title: 'Orders',
              subtitle: 'Track your orders',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: ProfileMenuItem(
              icon: Icons.favorite_outline,
              title: 'Wishlist',
              subtitle: 'Your saved items',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: ProfileMenuItem(
              icon: Icons.visibility_outlined,
              title: 'Viewed',
              subtitle: 'Recently viewed',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(child: _SectionLabel(label: 'Preferences')),
          SliverToBoxAdapter(
            child: ProfileMenuItem(
              icon: Icons.lock_outline,
              title: 'Forgot password',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: ProfileMenuItem(
              icon: Icons.dark_mode_outlined,
              title: 'Theme',
              subtitle: 'Light / Dark',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: ProfileMenuItem(
              icon: Icons.logout,
              title: 'Logout',
              iconBackgroundColor: colorScheme.errorContainer,
              iconColor: colorScheme.error,
              titleColor: colorScheme.error,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;

  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
