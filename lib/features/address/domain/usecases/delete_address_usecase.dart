import 'package:kartify/features/address/domain/repositories/address_repository.dart';

class DeleteAddressUsecase {
  final AddressRepository _repository;

  DeleteAddressUsecase({required AddressRepository repository})
    : _repository = repository;

  Future<void> call(String id) async {
    await _repository.deleteAddress(id);
  }
}
