import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/home_app_bar.widget.dart';
import 'widgets/home_body.widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const HomeAppBar(),
          SizedBox(
            height: 10.h,
          ),
          const Expanded(child: HomeBodyWidget()),
        ],
      ),
    );
  }
}
