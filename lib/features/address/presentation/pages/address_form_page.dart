import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartify/features/address/domain/domain.dart';
import 'package:kartify/features/address/presentation/bloc/address_bloc.dart';

class AddressFormPage extends StatefulWidget {
  final AddressEntity? address;

  const AddressFormPage({super.key, this.address});

  @override
  State<AddressFormPage> createState() => _AddressFormPageState();
}

class _AddressFormPageState extends State<AddressFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _streetController;
  late final TextEditingController _cityController;
  late final TextEditingController _stateController;
  late final TextEditingController _zipCodeController;
  late final TextEditingController _countryController;

  bool get _isEditing => widget.address != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.address?.name);
    _streetController = TextEditingController(text: widget.address?.street);
    _cityController = TextEditingController(text: widget.address?.city);
    _stateController = TextEditingController(text: widget.address?.state);
    _zipCodeController = TextEditingController(text: widget.address?.zipCode);
    _countryController = TextEditingController(text: widget.address?.country);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final address = AddressEntity(
      id:
          widget.address?.id ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text.trim(),
      street: _streetController.text.trim(),
      city: _cityController.text.trim(),
      state: _stateController.text.trim(),
      zipCode: _zipCodeController.text.trim(),
      country: _countryController.text.trim(),
      isDefault: widget.address?.isDefault ?? false,
    );

    if (_isEditing) {
      context.read<AddressBloc>().add(AddressUpdated(address: address));
    } else {
      context.read<AddressBloc>().add(AddressAdded(address: address));
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isEditing ? 'Edit Address' : 'New Address')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _FormField(
              controller: _nameController,
              label: 'Name',
              hint: 'Home, Work...',
            ),
            const SizedBox(height: 12),
            _FormField(
              controller: _streetController,
              label: 'Street',
              hint: '123 Main St',
            ),
            const SizedBox(height: 12),
            _FormField(
              controller: _cityController,
              label: 'City',
              hint: 'New York',
            ),
            const SizedBox(height: 12),
            _FormField(
              controller: _stateController,
              label: 'State',
              hint: 'NY',
            ),
            const SizedBox(height: 12),
            _FormField(
              controller: _zipCodeController,
              label: 'Zip Code',
              hint: '10001',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            _FormField(
              controller: _countryController,
              label: 'Country',
              hint: 'United States',
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _onSubmit,
              child: Text(_isEditing ? 'Save changes' : 'Add address'),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType keyboardType;

  const _FormField({
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '$label is required';
        }
        return null;
      },
    );
  }
}
