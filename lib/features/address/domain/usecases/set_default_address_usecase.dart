import 'package:kartify/features/address/domain/repositories/address_repository.dart';

class SetDefaultAddressUsecase {
  final AddressRepository _repository;

  SetDefaultAddressUsecase({required AddressRepository repository})
    : _repository = repository;

  Future<void> call(String id) async {
    await _repository.setDefaultAddress(id);
  }
}
