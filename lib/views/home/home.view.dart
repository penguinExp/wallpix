import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpix/designs/designs.dart';
import 'package:wallpix/designs/text_form.design.dart';
import 'package:wallpix/imgList.view.dart';

class HomeView extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 125.h,
              width: 375.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      DesignText.headingOne(
                        'WallPix',
                      ),
                      DesignText.headingOneHighlighted(
                        '.',
                      )
                    ],
                  ),
                  const DesignIcon.sunIcon()
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            DesignTextForm(
              hintTxt: 'hintTxt',
              suffixWidget: const DesignIcon.searchIcon(),
              textEditingController: controller,
              callBack: () {
                // log('message');
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: ImgListView(),
            )
          ],
        ),
      ),
    );
  }
}
