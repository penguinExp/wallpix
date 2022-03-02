import 'package:flutter/material.dart';

class ImgListView extends StatelessWidget {
  const ImgListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
    );
  }
}
