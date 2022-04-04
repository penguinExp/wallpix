import 'package:flutter/material.dart';
import 'package:wallpix/modules/images/presentation/widgets/imgs_list_body.widget.dart';

import '../widgets/appbar_widget.images.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          AppBarWidget(),
          ImgsListViewBody(),
        ],
      ),
    );
  }
}
