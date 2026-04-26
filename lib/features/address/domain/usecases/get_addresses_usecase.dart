import 'package:kartify/features/address/domain/entities/address_entity.dart';
import 'package:kartify/features/address/domain/repositories/address_repository.dart';

class GetAddressesUsecase {
  final AddressRepository _repository;

  GetAddressesUsecase({required AddressRepository repository})
    : _repository = repository;

  Future<List<AddressEntity>> call() async {
    return await _repository.getAddresses();
  }
}
