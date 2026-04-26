import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartify/features/address/domain/domain.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final GetAddressesUsecase _getAddressesUsecase;
  final AddAddressUsecase _addAddressUsecase;
  final UpdateAddressUsecase _updateAddressUsecase;
  final DeleteAddressUsecase _deleteAddressUsecase;
  final SetDefaultAddressUsecase _setDefaultAddressUsecase;

  AddressBloc({
    required GetAddressesUsecase getAddressesUsecase,
    required AddAddressUsecase addAddressUsecase,
    required UpdateAddressUsecase updateAddressUsecase,
    required DeleteAddressUsecase deleteAddressUsecase,
    required SetDefaultAddressUsecase setDefaultAddressUsecase,
  }) : _getAddressesUsecase = getAddressesUsecase,
       _addAddressUsecase = addAddressUsecase,
       _updateAddressUsecase = updateAddressUsecase,
       _deleteAddressUsecase = deleteAddressUsecase,
       _setDefaultAddressUsecase = setDefaultAddressUsecase,
       super(AddressInitial()) {
    on<AddressLoadRequested>(_onLoadRequested);
    on<AddressAdded>(_onAddressAdded);
    on<AddressUpdated>(_onAddressUpdated);
    on<AddressDeleted>(_onAddressDeleted);
    on<AddressDefaultSet>(_onAddressDefaultSet);
  }

  Future<void> _onLoadRequested(
    AddressLoadRequested event,
    Emitter<AddressState> emit,
  ) async {
    emit(AddressLoading());
    try {
      final addresses = await _getAddressesUsecase();
      emit(AddressLoaded(addresses: addresses));
    } catch (e) {
      emit(AddressError(message: e.toString()));
    }
  }

  Future<void> _onAddressAdded(
    AddressAdded event,
    Emitter<AddressState> emit,
  ) async {
    emit(AddressLoading());
    try {
      await _addAddressUsecase(event.address);
      final addresses = await _getAddressesUsecase();
      emit(AddressLoaded(addresses: addresses));
    } catch (e) {
      emit(AddressError(message: e.toString()));
    }
  }

  Future<void> _onAddressUpdated(
    AddressUpdated event,
    Emitter<AddressState> emit,
  ) async {
    emit(AddressLoading());
    try {
      await _updateAddressUsecase(event.address);
      final addresses = await _getAddressesUsecase();
      emit(AddressLoaded(addresses: addresses));
    } catch (e) {
      emit(AddressError(message: e.toString()));
    }
  }

  Future<void> _onAddressDeleted(
    AddressDeleted event,
    Emitter<AddressState> emit,
  ) async {
    emit(AddressLoading());
    try {
      await _deleteAddressUsecase(event.id);
      final addresses = await _getAddressesUsecase();
      emit(AddressLoaded(addresses: addresses));
    } catch (e) {
      emit(AddressError(message: e.toString()));
    }
  }

  Future<void> _onAddressDefaultSet(
    AddressDefaultSet event,
    Emitter<AddressState> emit,
  ) async {
    emit(AddressLoading());
    try {
      await _setDefaultAddressUsecase(event.id);
      final addresses = await _getAddressesUsecase();
      emit(AddressLoaded(addresses: addresses));
    } catch (e) {
      emit(AddressError(message: e.toString()));
    }
  }
}
