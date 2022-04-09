import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'designs.e.dart';

class DesignTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintTxt;
  final Widget suffixIcon;
  final void Function()? onIconTap;
  final void Function()? onFieldTap;
  final bool isFocused;
  final Color highLightColor, secBgColor;

  const DesignTextField({
    Key? key,
    required this.textEditingController,
    required this.hintTxt,
    required this.suffixIcon,
    this.onIconTap,
    this.onFieldTap,
    this.isFocused = false,
    required this.highLightColor,
    required this.secBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      decoration: BoxDecoration(
        color: secBgColor,
        border: Border.all(
          color: isFocused ? highLightColor : secBgColor,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      height: 56.h,
      width: 315.w,
      child: Row(
        children: [
          Expanded(
              child: TextField(
            style:
                TextPresets.headingFourSemiBold(Theme.of(context).primaryColor),
            controller: textEditingController,
            autocorrect: true,
            onTap: onFieldTap,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintTxt,
              hintStyle: TextPresets.headingFourRegular(
                  Theme.of(context).primaryColor),
            ),
          )),
          InkWell(
            onTap: onIconTap,
            child: suffixIcon,
          )
        ],
      ),
    );
  }
}
