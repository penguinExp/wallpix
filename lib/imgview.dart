import 'package:flutter/material.dart';
import 'package:wallpix/imgList.view.dart';


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
        // padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ImgListView()
      ),
    );
  }
}
