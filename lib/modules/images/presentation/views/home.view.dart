import 'package:flutter/material.dart';
import 'package:wallpix/core/core.dart';
import 'package:wallpix/modules/images/presentation/widgets/imgs_list_body.widget.dart';

import '../widgets/appbar_widget.images.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeService.backGround(),
      body: Column(
        children: [
          AppBarWidget(),
          const Expanded(child: ImgsListViewBody()),
        ],
      ),
    );
  }
}
