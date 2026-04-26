import 'package:kartify/features/address/domain/entities/address_entity.dart';
import 'package:kartify/features/address/domain/repositories/address_repository.dart';

class AddAddressUsecase {
  final AddressRepository _repository;

  AddAddressUsecase({required AddressRepository repository})
    : _repository = repository;

  Future<void> call(AddressEntity address) async {
    await _repository.addAddress(address);
  }
}
