import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpix/core/services/theme.service.dart';

class DesignTextForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintTxt;
  final Widget? suffixWidget;
  final void Function()? callBack;
  const DesignTextForm({
    Key? key,
    required this.hintTxt,
    required this.textEditingController,
    this.suffixWidget,
    this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: themeService.primery(), width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      height: 56.h,
      width: 315.w,
      child: Row(
        children: [
          SizedBox(
            width: 15.w,
          ),
          SizedBox(
            width: 241.w,
            height: 56.h,
            child: TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: hintTxt,
                focusColor: themeService.highLight(),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(child: suffixWidget ?? Container(), onTap: callBack,),
          SizedBox(
            width: 15.w,
          ),
        ],
      ),
    );
  }
}
