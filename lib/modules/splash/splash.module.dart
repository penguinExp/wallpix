import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpix/modules/images/presentation/views/home.view.dart';
import '../../designs/designs.design.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final String title = 'WallPix';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 6), () {
      Get.offAndToNamed('/home');
    });
    return Scaffold(
      backgroundColor: DarkThemeColors.background,
      body: Center(
        child: TweenAnimationBuilder(
          tween: StepTween(begin: 0, end: 7),
          duration: const Duration(
            milliseconds: 400,
          ),
          builder: (BuildContext context, int val, Widget? child) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DesignText.headingOne(
                    text: title.substring(0, val),
                    color: DarkThemeColors.primery,
                  ),
                  DesignText.headingOne(
                    text: '.',
                    color: DarkThemeColors.highLight,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
