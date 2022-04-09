import 'package:flutter/material.dart';
import '../../../../designs/text_field.designs.dart';

import 'dart:developer';
import '../../../../designs/designs.e.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({Key? key}) : super(key: key);

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          DesignTextField(
            isFocused: true,
            textEditingController: controller,
            hintTxt: 'Search WallPix',
            highLightColor: Theme.of(context).colorScheme.onPrimary,
            secBgColor: Theme.of(context).colorScheme.onBackground,
            suffixIcon: DesignIcon.searchIcon(
              color: Theme.of(context).primaryColor,
            ),
            onIconTap: () {
              log("message");
            },
          ),
        ],
      ),
    );
  }
}
