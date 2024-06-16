import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:market/core/networking/api_client.dart';
import 'package:market/data/data_sources/remote/products_service.dart';
import 'package:market/data/repositories/product_repository_impl.dart';
import 'package:market/domain/domain/get_product_by_id_usecase.dart';
import 'package:market/domain/domain/get_products_usecase.dart';
import 'package:market/domain/repositories/products_repository.dart';
import 'package:market/ui/product_detail/cubit/product_detail_cubit.dart';
import 'package:market/ui/product_list/cubit/product_list_cubit.dart';

final sl = GetIt.instance;
init() {
  //Data
  sl.registerLazySingleton(() => ApiClient(baseUrl: dotenv.env['API_URL']!));
  sl.registerLazySingleton(() => ProductsService(client: sl()));
  sl.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(productDataSource: sl()));

  //Domain
  sl.registerLazySingleton<GetProductsUsecase>(() => GetProductsUsecase(sl()));
  sl.registerLazySingleton<GetProductByIdUsecase>(
      () => GetProductByIdUsecase(sl()));
  //Presentation
  sl.registerFactory<ProductListCubit>(
      () => ProductListCubit(getProductsUsecase: sl()));
  sl.registerFactory(() => ProductDetailCubit(getProductByIdUsecase: sl()));
}
