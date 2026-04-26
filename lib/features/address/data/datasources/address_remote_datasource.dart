import 'package:kartify/features/address/data/models/address_model.dart';

abstract class AddressRemoteDatasource {
  Future<List<AddressModel>> getAddresses();
  Future<void> addAddress(AddressModel address);
  Future<void> updateAddress(AddressModel address);
  Future<void> deleteAddress(String id);
  Future<void> setDefaultAddress(String id);
}
