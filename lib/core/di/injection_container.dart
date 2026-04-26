import 'package:get_it/get_it.dart';
import 'package:kartify/features/address/address.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  _setupAddress();
}

void _setupAddress() {
  // Datasource
  getIt.registerLazySingleton<AddressRemoteDatasource>(
    () => AddressRemoteDatasourceImpl(),
  );

  // Repository
  getIt.registerLazySingleton<AddressRepository>(
    () => AddressRepositoryImpl(
      remoteDatasource: getIt<AddressRemoteDatasource>(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(
    () => GetAddressesUsecase(repository: getIt<AddressRepository>()),
  );
  getIt.registerLazySingleton(
    () => AddAddressUsecase(repository: getIt<AddressRepository>()),
  );
  getIt.registerLazySingleton(
    () => UpdateAddressUsecase(repository: getIt<AddressRepository>()),
  );
  getIt.registerLazySingleton(
    () => DeleteAddressUsecase(repository: getIt<AddressRepository>()),
  );
  getIt.registerLazySingleton(
    () => SetDefaultAddressUsecase(repository: getIt<AddressRepository>()),
  );

  // BLoC
  getIt.registerFactory(
    () => AddressBloc(
      getAddressesUsecase: getIt<GetAddressesUsecase>(),
      addAddressUsecase: getIt<AddAddressUsecase>(),
      updateAddressUsecase: getIt<UpdateAddressUsecase>(),
      deleteAddressUsecase: getIt<DeleteAddressUsecase>(),
      setDefaultAddressUsecase: getIt<SetDefaultAddressUsecase>(),
    ),
  );
}
