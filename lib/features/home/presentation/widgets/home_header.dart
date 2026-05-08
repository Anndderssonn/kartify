import 'package:flutter/material.dart';
import 'package:kartify/core/core.dart';

class HomeHeader extends StatelessWidget {
  final String username;
  final ValueChanged<String> onSearch;
  final String bannerEmoji;
  final String bannerTitle;
  final String bannerSubtitle;
  final String bannerButtonLabel;
  final VoidCallback onBannerTap;

  const HomeHeader({
    super.key,
    required this.username,
    required this.onSearch,
    required this.bannerEmoji,
    required this.bannerTitle,
    required this.bannerSubtitle,
    required this.bannerButtonLabel,
    required this.onBannerTap,
  });

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 18) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      color: colorScheme.primary,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$_greeting,',
                              style: TextStyle(
                                fontSize: 12,
                                color: colorScheme.onPrimary.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                            ),
                            Text(
                              '$username 👋',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: colorScheme.onPrimary.withValues(
                          alpha: 0.2,
                        ),
                        child: Text(
                          StringUtils.getInitials(username),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SearchBar(
                    onChanged: onSearch,
                    hintText: 'Search products...',
                    leading: const Icon(Icons.search),
                    backgroundColor: WidgetStatePropertyAll(
                      colorScheme.surface,
                    ),
                    elevation: const WidgetStatePropertyAll(0),
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Transform.translate(
                offset: const Offset(0, 40),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  constraints: const BoxConstraints(minHeight: 140),
                  child: Row(
                    children: [
                      Text(bannerEmoji, style: const TextStyle(fontSize: 56)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today's deal",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Text(
                              bannerTitle,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              bannerSubtitle,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      FilledButton(
                        onPressed: onBannerTap,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          bannerButtonLabel,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
