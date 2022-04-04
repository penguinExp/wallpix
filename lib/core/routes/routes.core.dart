import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wallpix/modules/images/injection_container.images.dart';
import 'package:wallpix/modules/images/presentation/controllers/bloc/imgs_bloc.dart';
import 'package:wallpix/modules/images/presentation/views/home.view.dart';
import '../../modules/splash/splash.module.dart';

class WallPixRoutes {
  static List<GetPage> getPages = <GetPage>[
    GetPage(
      name: '/',
      page: () => const SplashView(),
    ),
    GetPage(
      name: '/home',
      page: () => BlocProvider<ImgsBloc>(
        create: (_) => sl<ImgsBloc>()..add(const GetCuratedImgsEvent(page: 1)),
        child: const HomeView(),
      ),
    ),
  ];
}
