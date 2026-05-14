import 'package:get_it/get_it.dart';
import 'package:kartify/features/features.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  _setupAddress();
  _setupCategories();
  _setupProducts();
  _setupCart();
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

void _setupCategories() {
  getIt.registerLazySingleton<CategoryRemoteDatasource>(
    () => CategoryRemoteDatasourceImpl(),
  );

  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(
      remoteDatasource: getIt<CategoryRemoteDatasource>(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetCategoriesUsecase(repository: getIt<CategoryRepository>()),
  );

  getIt.registerFactory(
    () => CategoryBloc(getCategoriesUsecase: getIt<GetCategoriesUsecase>()),
  );
}

void _setupProducts() {
  getIt.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDatasource: getIt<ProductRemoteDatasource>(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetProductsByCategoryUsecase(repository: getIt<ProductRepository>()),
  );

  getIt.registerFactory(
    () => ProductBloc(
      getProductsByCategoryUsecase: getIt<GetProductsByCategoryUsecase>(),
    ),
  );
}

void _setupCart() {
  getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImpl());

  getIt.registerLazySingleton(
    () => GetCartItemsUsecase(repository: getIt<CartRepository>()),
  );

  getIt.registerLazySingleton(
    () => AddToCartUsecase(repository: getIt<CartRepository>()),
  );

  getIt.registerLazySingleton(
    () => RemoveFromCartUsecase(repository: getIt<CartRepository>()),
  );

  getIt.registerLazySingleton(
    () => UpdateQuantityUsecase(repository: getIt<CartRepository>()),
  );

  getIt.registerLazySingleton(
    () => ClearCartUsecase(repository: getIt<CartRepository>()),
  );

  getIt.registerSingleton(
    CartBloc(
      getCartItemsUsecase: getIt<GetCartItemsUsecase>(),
      addToCartUsecase: getIt<AddToCartUsecase>(),
      removeFromCartUsecase: getIt<RemoveFromCartUsecase>(),
      updateQuantityUsecase: getIt<UpdateQuantityUsecase>(),
      clearCartUsecase: getIt<ClearCartUsecase>(),
    ),
  );
}
