import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wallpix/core/keys.core.dart';
import 'package:wallpix/prev/designs/text.design.dart';
import 'package:wallpix/prev/designs/text_form.design.dart';
import 'package:wallpix/prev/imgList.view.dart';
import 'package:http/http.dart' as http;

import '../../designs/icons.design.dart';
import '../../models/img.model.dart';

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
            // GetBuilder(
            //   init: Get.put<ApiCall>(ApiCall()),
            //   initState:,


            //   builder: ((ApiCall controller) {
            //     return SizedBox(
            //       child: Image.network(controller.curatedImgs[0].src.portrait),
            //     );
            //   }),
            // )
          ],
        ),
      ),
    );
  }
}

class ApiCall extends GetxController {
  List<Img> curatedImgs = [];
  final RxBool isLoading = false.obs;
  final String uri = 'https://api.pexels.com/v1/curated?per_page=80&page=1';
  @override
  onInit() async {
    await getCuratedImgs();
    super.onInit();
  }

  Future<void> getCuratedImgs() async {
    isLoading.value = true;
    http.Response response =
        await http.get(Uri.parse(uri), headers: {"Authorization": 'accessKey'});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<dynamic> jsonImgS = jsonData['photos'];
    for (var element in jsonImgS) {
      curatedImgs.add(
        Img.fromJson(element),
      );
    }
    isLoading.value = false;
    update();
  }
}
