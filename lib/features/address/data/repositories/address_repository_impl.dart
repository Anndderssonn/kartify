import 'package:kartify/features/address/data/datasources/address_remote_datasource.dart';
import 'package:kartify/features/address/data/models/address_model.dart';
import 'package:kartify/features/address/domain/domain.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressRemoteDatasource _remoteDatasource;

  AddressRepositoryImpl({required AddressRemoteDatasource remoteDatasource})
    : _remoteDatasource = remoteDatasource;

  @override
  Future<List<AddressEntity>> getAddresses() async {
    return await _remoteDatasource.getAddresses();
  }

  @override
  Future<void> addAddress(AddressEntity address) async {
    final model = AddressModel(
      id: address.id,
      name: address.name,
      street: address.street,
      city: address.city,
      state: address.state,
      zipCode: address.zipCode,
      country: address.country,
      isDefault: address.isDefault,
    );
    await _remoteDatasource.addAddress(model);
  }

  @override
  Future<void> updateAddress(AddressEntity address) async {
    final model = AddressModel(
      id: address.id,
      name: address.name,
      street: address.street,
      city: address.city,
      state: address.state,
      zipCode: address.zipCode,
      country: address.country,
      isDefault: address.isDefault,
    );
    await _remoteDatasource.updateAddress(model);
  }

  @override
  Future<void> deleteAddress(String id) async {
    await _remoteDatasource.deleteAddress(id);
  }

  @override
  Future<void> setDefaultAddress(String id) async {
    await _remoteDatasource.setDefaultAddress(id);
  }
}
