import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../core/core.dart';

import 'designs.design.dart';

class DesignIcon extends StatelessWidget {
  final String iconAssetPath;
  final Color? color;

  const DesignIcon.backIcon({Key? key, this.color})
      : iconAssetPath = IconAssets.backIcon,
        super(key: key);

  const DesignIcon.crossIcon({Key? key, this.color})
      : iconAssetPath = IconAssets.crossIcon,
        super(key: key);

  const DesignIcon.downloadIcon({Key? key, this.color})
      : iconAssetPath = IconAssets.downloadIcon,
        super(key: key);

  const DesignIcon.nightIcon({Key? key, this.color})
      : iconAssetPath = IconAssets.nightIcon,
        super(key: key);

  const DesignIcon.searchIcon({Key? key, this.color})
      : iconAssetPath = IconAssets.searchIcon,
        super(key: key);

  const DesignIcon.sunIcon({Key? key, this.color})
      : iconAssetPath = IconAssets.sunIcon,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width * 0.076,
      width: Get.width * 0.076,
      child: SvgPicture.asset(
        iconAssetPath,
        fit: BoxFit.contain,
        color: color ?? themeService.primery(),
      ),
    );
  }
}
