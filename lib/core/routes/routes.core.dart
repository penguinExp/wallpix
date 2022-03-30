import 'package:get/get.dart';
import '../../modules/splash/splash.module.dart';

class WallPixRoutes {
  static List<GetPage> getPages = <GetPage>[
    GetPage(
      name: '/',
      page: () => const SplashView(),
    ),
  ];
}
