import 'package:flutter/material.dart';
import 'designs.design.dart';

class DesignText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;

  DesignText.headingOne({
    Key? key,
    required this.text,
    this.color,
  })  : style = TextPresets.headingOne(color),
        super(key: key);

  DesignText.headingTwo({
    Key? key,
    required this.text,
    this.color,
  })  : style = TextPresets.headingTwo(color),
        super(key: key);

  DesignText.headingThree({
    Key? key,
    required this.text,
    this.color,
  })  : style = TextPresets.headingThree(color),
        super(key: key);

  DesignText.headingFourRegular({
    Key? key,
    required this.text,
    this.color,
  })  : style = TextPresets.headingFourRegular(color),
        super(key: key);

  DesignText.headingFourSemiBold({
    Key? key,
    required this.text,
    this.color,
  })  : style = TextPresets.headingFourSemiBold(color),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}