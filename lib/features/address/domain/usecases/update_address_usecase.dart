import 'package:kartify/features/address/domain/entities/address_entity.dart';
import 'package:kartify/features/address/domain/repositories/address_repository.dart';

class UpdateAddressUsecase {
  final AddressRepository _repository;

  UpdateAddressUsecase({required AddressRepository repository})
    : _repository = repository;

  Future<void> call(AddressEntity address) async {
    await _repository.updateAddress(address);
  }
}
