import 'package:flutter/material.dart';
import 'designs.design.dart';

class DesignText extends StatelessWidget {
  final String text;
  final TextStyle style;

  DesignText.headingOne({
    Key? key,
    required this.text,
  })  : style = TextPresets.headingOne,
        super(key: key);

  DesignText.headingOneHighLighted({
    Key? key,
    required this.text,
  })  : style = TextPresets.headingOneHighLighted,
        super(key: key);

  DesignText.headingTwo({
    Key? key,
    required this.text,
  })  : style = TextPresets.headingTwo,
        super(key: key);

  DesignText.headingThree({
    Key? key,
    required this.text,
  })  : style = TextPresets.headingThree,
        super(key: key);

  DesignText.headingFourRegular({
    Key? key,
    required this.text,
  })  : style = TextPresets.headingFourRegular,
        super(key: key);

  DesignText.headingFourSemiBold({
    Key? key,
    required this.text,
  })  : style = TextPresets.headingFourSemiBold,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
