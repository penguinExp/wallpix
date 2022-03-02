import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class PageUI extends StatefulWidget {
  const PageUI({Key? key}) : super(key: key);

  @override
  State<PageUI> createState() => _PageState();
}

class _PageState extends State<PageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: GetX(
            init: Get.put<Imgctrl>(Imgctrl()),
            builder: (Imgctrl ctrl) {
              return ctrl.initialized
                  ? const Center(
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        // child: Image.network(ctrl.imgList[0].src.portrait),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      ),
    );
  }
}

class Imgctrl extends GetxController {
  List<Img> imgList = <Img>[];

  Future<void> getImgs() async {
    http.Response response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=10&page=1"),
        headers: {
          "Authorization":
              '563492ad6f917000010000012f79d12ef37c4b1cb056cf13e223020a'
        });
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<dynamic> imgBody = jsonData['photos'];
    for (var element in imgBody) {
      imgList.add(Img.fromJson(element));
    }
  }

  @override
  Future<void> onInit() async {
    await getImgs();
    log(imgList.length.toString());
    super.onInit();
  }
}
