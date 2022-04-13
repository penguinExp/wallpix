import 'package:flutter/material.dart';
import 'package:wallpaper/wallpaper.dart';

import '../../../designs/designs.e.dart';

class DownloadButtonWidget extends StatefulWidget {
  final String downloadLink;
  const DownloadButtonWidget({
    Key? key,
    required this.downloadLink,
  }) : super(key: key);

  @override
  State<DownloadButtonWidget> createState() => _DownloadButtonWidgetState();
}

class _DownloadButtonWidgetState extends State<DownloadButtonWidget> {
  bool isDownloading = false;
  String downloadProgress = '0';
  @override
  Widget build(BuildContext context) {
    return DesignButton.defaultBtn(
      onTap: () {},
      textcolor: Theme.of(context).primaryColor,
      btnText: isDownloading ? '$downloadProgress %' : 'Download',
      bgColor: Theme.of(context).colorScheme.onBackground,
      icon: isDownloading
          ? null
          : DesignIcon.downloadIcon(
              color: Theme.of(context).primaryColor,
            ),
    );
  }

  Future<void> downloadAndSetWallPaper() async {
    if (!isDownloading) {
      final progress = Wallpaper.imageDownloadProgress(
        widget.downloadLink,
      );
      progress.listen(
        (event) {
          setState(() {
            isDownloading = true;
            downloadProgress = event;
          });
        },
        onDone: () {
          setState(() {
            isDownloading = false;
          });
          Wallpaper.homeScreen();
        },
      );
    }
  }
}