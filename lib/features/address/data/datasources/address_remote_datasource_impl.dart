import 'package:kartify/features/address/data/datasources/address_remote_datasource.dart';
import 'package:kartify/features/address/data/models/address_model.dart';

class AddressRemoteDatasourceImpl implements AddressRemoteDatasource {
  final List<AddressModel> _mockAddresses = [
    AddressModel(
      id: '1',
      name: 'Home',
      street: '123 Main St',
      city: 'New York',
      state: 'NY',
      zipCode: '10001',
      country: 'United States',
      isDefault: true,
    ),
    AddressModel(
      id: '2',
      name: 'Work',
      street: '456 Office Ave',
      city: 'New York',
      state: 'NY',
      zipCode: '10002',
      country: 'United States',
      isDefault: false,
    ),
  ];

  @override
  Future<List<AddressModel>> getAddresses() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return List.from(_mockAddresses);
  }

  @override
  Future<void> addAddress(AddressModel address) async {
    await Future.delayed(const Duration(milliseconds: 800));
    _mockAddresses.add(address);
  }

  @override
  Future<void> updateAddress(AddressModel address) async {
    await Future.delayed(const Duration(milliseconds: 800));
    final index = _mockAddresses.indexWhere((a) => a.id == address.id);
    if (index != -1) {
      _mockAddresses[index] = address;
    }
  }

  @override
  Future<void> deleteAddress(String id) async {
    await Future.delayed(const Duration(milliseconds: 800));
    _mockAddresses.removeWhere((a) => a.id == id);
  }

  @override
  Future<void> setDefaultAddress(String id) async {
    await Future.delayed(const Duration(milliseconds: 800));
    final updated = _mockAddresses.map((a) {
      return AddressModel(
        id: a.id,
        name: a.name,
        street: a.street,
        city: a.city,
        state: a.state,
        zipCode: a.zipCode,
        country: a.country,
        isDefault: a.id == id,
      );
    }).toList();
    _mockAddresses
      ..clear()
      ..addAll(updated);
  }
}
