import 'package:flutter/material.dart';

// Text Styles

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'designs.dart';

final TextStyle heading1 = FontUtil.nunito(
  fontSize: 61.sp,
  fontWeight: FontWeight.w700,
);

final TextStyle heading2 = FontUtil.nunito(
  fontSize: 40.5.sp,
  fontWeight: FontWeight.w700,
);

final TextStyle heading3Regular = FontUtil.nunito(
  fontSize: 17.5.sp,
  fontWeight: FontWeight.w400,
);

final TextStyle heading3SemiBold = FontUtil.nunito(
  fontSize: 17.5.sp,
  fontWeight: FontWeight.w600,
);


class DesignText extends StatelessWidget {
  final String text;
  final TextStyle style;

  DesignText.headingOne(this.text, {Key? key})
      : style = heading1,
        super(key: key);
  DesignText.headingTwo(this.text, {Key? key})
      : style = heading2,
        super(key: key);
  DesignText.headingThreeR(this.text, {Key? key})
      : style = heading3Regular,
        super(key: key);
  DesignText.headingThreeSB(this.text, {Key? key})
      : style = heading3SemiBold,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
