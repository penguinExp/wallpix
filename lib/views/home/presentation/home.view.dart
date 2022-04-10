import 'package:flutter/material.dart';
import 'widgets/home_app_bar.widget.dart';
import 'widgets/home_body.widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          children: const [
            HomeAppBar(),
            HomeBodyWidget(),
          ],
        ),
      ),
    );
  }
}
