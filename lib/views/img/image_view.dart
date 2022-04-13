import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wallpaper/wallpaper.dart';
import 'package:wallpix/designs/designs.e.dart';
import 'package:wallpix/views/img/widgets/image_download_button.widget.dart';

class ImageView extends StatelessWidget {
  final String downloadLink;
  final String imageUrl;
  final String blurHash;
  final String id;
  const ImageView({
    Key? key,
    required this.downloadLink,
    required this.imageUrl,
    required this.blurHash,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: id,
            child: SizedBox(
              child: BlurHashImage(
                height: Get.height,
                width: Get.width,
                blurHash: blurHash,
                image: imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DownloadButtonWidget(
                  downloadLink: downloadLink,
                ),
                SizedBox(
                  height: 20.h,
                ),
                DesignButton.defaultBtn(
                  onTap: () {
                    Get.back();
                  },
                  textcolor: Theme.of(context).primaryColor,
                  btnText: 'Cancel',
                  bgColor: Theme.of(context).colorScheme.tertiaryContainer,
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
