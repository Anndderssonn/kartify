part of 'address_bloc.dart';

sealed class AddressEvent {}

final class AddressLoadRequested extends AddressEvent {}

final class AddressAdded extends AddressEvent {
  final AddressEntity address;
  AddressAdded({required this.address});
}

final class AddressUpdated extends AddressEvent {
  final AddressEntity address;
  AddressUpdated({required this.address});
}

final class AddressDeleted extends AddressEvent {
  final String id;
  AddressDeleted({required this.id});
}

final class AddressDefaultSet extends AddressEvent {
  final String id;
  AddressDefaultSet({required this.id});
}
