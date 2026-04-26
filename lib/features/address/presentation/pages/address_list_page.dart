import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kartify/features/address/domain/domain.dart';
import 'package:kartify/features/address/presentation/bloc/address_bloc.dart';
import 'package:kartify/features/address/presentation/pages/address_form_page.dart';

class AddressListPage extends StatelessWidget {
  const AddressListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Addresses'),
        leading: BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                final defaultAddress = state is AddressLoaded
                    ? state.defaultAddress?.street
                    : null;
                context.pop(defaultAddress);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<AddressBloc>(),
              child: const AddressFormPage(),
            ),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<AddressBloc, AddressState>(
        listener: (context, state) {
          if (state is AddressError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is AddressLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AddressLoaded) {
            if (state.addresses.isEmpty) {
              return const Center(child: Text('No addresses yet'));
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.addresses.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final address = state.addresses[index];
                return _AddressCard(address: address);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final AddressEntity address;

  const _AddressCard({required this.address});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: address.isDefault
              ? colorScheme.primary
              : colorScheme.outlineVariant,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    address.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (address.isDefault)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Default',
                      style: TextStyle(
                        fontSize: 11,
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              address.street,
              style: TextStyle(
                fontSize: 13,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              '${address.city}, ${address.state} ${address.zipCode}',
              style: TextStyle(
                fontSize: 13,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              address.country,
              style: TextStyle(
                fontSize: 13,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                if (!address.isDefault)
                  TextButton(
                    onPressed: () {
                      context.read<AddressBloc>().add(
                        AddressDefaultSet(id: address.id),
                      );
                    },
                    child: const Text('Set as default'),
                  ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: context.read<AddressBloc>(),
                        child: AddressFormPage(address: address),
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.edit_outlined),
                ),
                IconButton(
                  onPressed: () {
                    context.read<AddressBloc>().add(
                      AddressDeleted(id: address.id),
                    );
                  },
                  icon: Icon(Icons.delete_outline, color: colorScheme.error),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
