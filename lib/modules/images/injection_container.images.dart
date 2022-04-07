import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:wallpix/core/core.dart';
import 'package:wallpix/modules/images/data/dataSource/img_data_source.data.dart';
import 'package:wallpix/modules/images/data/repositories/img_repository_impl.dart';
import 'package:wallpix/modules/images/domain/domain.images.dart';
import 'package:http/http.dart' as http;
import 'package:wallpix/modules/images/presentation/controllers/bloc/imgs_bloc.dart';



/// Service locator
final sl = GetIt.instance;

void init() {
  //! Features
  //* blocs
  sl.registerFactory(
    () => ImgsBloc(
      getCuratedImgs: sl(),
      searchImgs: sl(),
    ),
  );

  //* usecases
  sl.registerLazySingleton(() => GetCuratedImgs(sl()));
  sl.registerLazySingleton(() => SearchImgs(sl()));

  //* Repository

  sl.registerLazySingleton<ImgRepository>(() => ImgRepositoryImpl(
        imageDataSource: sl(),
        networkInfo: sl(),
      ));

  //! Data Sources
  sl.registerLazySingleton<ImageDataSource>(
    () => ImageDataSourceImpl(httpClient: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetWorkInfoImpl(dataConnectionChecker: sl()),
  );

  //! External packages
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
