import 'package:dengun_challenge/core/data/datasources/dio_products_remote_datasource.dart';
import 'package:dengun_challenge/core/data/datasources/i_products_remote_datasource.dart';
import 'package:dengun_challenge/core/data/repositories/products_repository.dart';
import 'package:dengun_challenge/core/domain/entities/all_products_list.dart';
import 'package:dengun_challenge/core/domain/entities/product.dart';
import 'package:dengun_challenge/core/domain/repositories/i_products_repository.dart';
import 'package:dengun_challenge/core/domain/usecases/get_products.dart';
import 'package:dengun_challenge/features/products_list/domain/usecases/get_products_by_tag.dart';
import 'package:dengun_challenge/features/products_list/domain/usecases/get_variants_total_inventory_quantity.dart';
import 'package:dengun_challenge/features/products_list/domain/usecases/set_product_first_image_url.dart';
import 'package:dengun_challenge/features/tags_list/domain/usecases/get_tags.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

init() {
  //! Core
  // Datasources
  getIt.registerLazySingleton<IProductsRemoteDatasource>(
      () => DioProductsRemoteDatasource(dio: getIt()));

  // Repositories
  getIt.registerLazySingleton<IProductsRepository>(
      () => ProductsRepository(productsRemoteDatasource: getIt()));

  // Usecases
  getIt.registerLazySingleton<GetProducts>(
      () => GetProducts(repository: getIt()));

  getIt.registerLazySingleton<AllProductsList>(() => AllProductsList());

  //! Features
  // Usecases
  getIt.registerLazySingleton<GetTags>(() => GetTags());
  getIt.registerLazySingleton<GetProductsByTag>(() => GetProductsByTag());
  getIt.registerLazySingleton<GetVariantsTotalInventoryQuantity>(
      () => GetVariantsTotalInventoryQuantity());
  getIt.registerLazySingleton<SetProductFirstImageUrl>(
      () => SetProductFirstImageUrl(repository: getIt()));
  //! External
  getIt.registerLazySingleton<Dio>(() => Dio());
}
