import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:wallpix/core/services/network_connectivity.service.dart';
import 'package:wallpix/views/home/data/datasource/img_data_source.impl.dart';
import 'package:wallpix/views/home/data/repositories/img_repository.impl.dart';
import 'package:wallpix/views/home/domain/domain.e.dart';
import 'package:http/http.dart' as http;
import 'package:wallpix/views/home/presentation/blocs/imagesBloc/images_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => ImagesBloc(
        getCuratedImgUseCase: sl(),
        searchImgUseCase: sl(),
      ));

  sl.registerLazySingleton(() => GetCuratedImgUseCaseImpl(imgRepository: sl()));
  sl.registerLazySingleton(() => SearchImgUseCaseImpl(imgRepository: sl()));

  sl.registerLazySingleton(
      () => ImgRepositoryImpl(imgDataSource: sl(), networkInfo: sl()));

  //! Data Sources
  sl.registerLazySingleton(
    () => ImgDataSourceImpl(
      httpClient: sl(),
    ),
  );

  sl.registerLazySingleton(
      () => NetWorkInfoImpl(dataConnectionChecker: DataConnectionChecker()));
  sl.registerLazySingleton(() => http.Client());
}
