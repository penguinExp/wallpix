import 'package:get/get.dart';
import 'package:wallpix/modules/splash/splash.module.dart';

class WallPixRoutes {
  static List<GetPage> getPages = <GetPage>[
    GetPage(
      name: '/',
      page: () => const SplashView(),
    ),
  ];
}
