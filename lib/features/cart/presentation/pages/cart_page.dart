import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartify/features/cart/domain/domain.dart';
import 'package:kartify/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:kartify/features/shared/shared.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Text(
              'My Cart (${state.totalItems} items)',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            );
          },
        ),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.isEmpty) return const SizedBox();
              return TextButton(
                onPressed: () => context.read<CartBloc>().add(CartCleared()),
                child: Text(
                  'Clear all',
                  style: TextStyle(color: colorScheme.error),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 64,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 16,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return _CartItemCard(item: state.items[index]);
                  },
                ),
              ),
              _CartSummary(state: state),
            ],
          );
        },
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final CartItemEntity item;

  const _CartItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        height: 110,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: item.product.imageUrl,
              width: 100,
              height: 110,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 100,
                height: 110,
                color: colorScheme.primaryContainer,
              ),
              errorWidget: (context, url, error) => Container(
                width: 100,
                height: 110,
                color: colorScheme.primaryContainer,
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: colorScheme.primary,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.product.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                item.product.unit,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.read<CartBloc>().add(
                            CartItemRemoved(productId: item.product.id),
                          ),
                          child: Icon(
                            Icons.close,
                            size: 18,
                            color: colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${(item.product.price * item.quantity).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: colorScheme.primary,
                          ),
                        ),
                        Row(
                          children: [
                            QuantityButton(
                              icon: Icons.remove,
                              onTap: () {
                                if (item.quantity == 1) {
                                  context.read<CartBloc>().add(
                                    CartItemRemoved(productId: item.product.id),
                                  );
                                } else {
                                  context.read<CartBloc>().add(
                                    CartQuantityUpdated(
                                      productId: item.product.id,
                                      quantity: item.quantity - 1,
                                    ),
                                  );
                                }
                              },
                              backgroundColor: colorScheme.primaryContainer,
                              iconColor: colorScheme.primary,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                '${item.quantity}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ),
                            QuantityButton(
                              icon: Icons.add,
                              onTap: () => context.read<CartBloc>().add(
                                CartQuantityUpdated(
                                  productId: item.product.id,
                                  quantity: item.quantity + 1,
                                ),
                              ),
                              backgroundColor: colorScheme.primary,
                              iconColor: colorScheme.onPrimary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartSummary extends StatelessWidget {
  final CartState state;

  const _CartSummary({required this.state});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                '\$${state.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Checkout — \$${state.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
