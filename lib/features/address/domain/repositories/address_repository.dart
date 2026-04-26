import 'package:kartify/features/address/domain/entities/address_entity.dart';

abstract class AddressRepository {
  Future<List<AddressEntity>> getAddresses();
  Future<void> addAddress(AddressEntity address);
  Future<void> updateAddress(AddressEntity address);
  Future<void> deleteAddress(String id);
  Future<void> setDefaultAddress(String id);
}
