import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'wallpix.dart';

Future<void> main() async {
  Get.put<GetStorage>(GetStorage());
  runApp(const WallPix());
}
