import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class AnimationAssets {
  static const String loader = 'assets/animations/loader.riv';
}

class LoaderAnimationWidget extends StatelessWidget {
  const LoaderAnimationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      height: 75.h,
      child: const RiveAnimation.asset(
        AnimationAssets.loader,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
