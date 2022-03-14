import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpix/core/services/theme.service.dart';

import 'designs.dart';

class DesignIcon extends StatelessWidget {
  final String iconPath;
  const DesignIcon({
    Key? key,
    required this.iconPath,
  }) : super(key: key);

  const DesignIcon.backIcon({Key? key})
      : iconPath = SvgIcons.backIcon,
        super(key: key);
  const DesignIcon.crossIcon({Key? key})
      : iconPath = SvgIcons.crossIcon,
        super(key: key);
  const DesignIcon.downloadIcon({Key? key})
      : iconPath = SvgIcons.downloadIcon,
        super(key: key);
  const DesignIcon.nightIcon({Key? key})
      : iconPath = SvgIcons.nightIcon,
        super(key: key);
  const DesignIcon.searchIcon({Key? key})
      : iconPath = SvgIcons.searchIcon,
        super(key: key);
  const DesignIcon.sunIcon({Key? key})
      : iconPath = SvgIcons.sunIcon,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.w,
      width: 24.w,
      child: SvgPicture.asset(
        iconPath,
        color: themeService.primery(),
        fit: BoxFit.contain,
      ),
    );
  }
}
