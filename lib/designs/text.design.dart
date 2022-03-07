import 'package:flutter/material.dart';
import 'package:wallpix/designs/utils/text_styles.design.dart';

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
