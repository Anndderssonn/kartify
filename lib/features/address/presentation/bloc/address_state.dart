part of 'address_bloc.dart';

sealed class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final List<AddressEntity> addresses;

  AddressLoaded({required this.addresses});

  AddressEntity? get defaultAddress =>
      addresses.where((a) => a.isDefault).firstOrNull;
}

class AddressError extends AddressState {
  final String message;
  AddressError({required this.message});
}
