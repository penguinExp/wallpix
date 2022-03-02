import 'package:flutter/material.dart';
import 'package:wallpix/utils/theme/theme_service.util.dart';

class PageUI extends StatefulWidget {
  const PageUI({Key? key}) : super(key: key);

  @override
  State<PageUI> createState() => _PageState();
}

class _PageState extends State<PageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: IconButton(
              onPressed: () {
                ThemeService().switchTheme();
              },
              icon: const Icon(Icons.night_shelter))),
    );
  }
}
