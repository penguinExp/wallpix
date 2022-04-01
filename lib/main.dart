import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'modules/images/injection_container.images.dart' as di;
import 'wallpix.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Get.put<GetStorage>(GetStorage());
  di.init();
  runApp(const WallPix());
  FlutterNativeSplash.remove();
}