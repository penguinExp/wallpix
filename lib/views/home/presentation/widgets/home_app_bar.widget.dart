import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../blocs/themeCubit/theme_cubit.dart';

import '../../../../designs/designs.e.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30.w, 60.h, 30.w, 10.h),
      color: Theme.of(context).colorScheme.background,
      child: Row(
        children: [
          Row(
            children: [
              DesignText.headingOne(
                text: 'WallPix',
                color: Theme.of(context).primaryColor,
              ),
              DesignText.headingOne(
                text: '.',
                color: Theme.of(context).colorScheme.onPrimary,
              )
            ],
          ),
          Expanded(child: Container()),
          BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
            if (state is LightThemeState) {
              return InkWell(
                onTap: () =>
                    BlocProvider.of<ThemeCubit>(context).toggleThemeMode(),
                child: DesignIcon.nightIcon(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else if (state is DarkThemeState) {
              return InkWell(
                onTap: () =>
                    BlocProvider.of<ThemeCubit>(context).toggleThemeMode(),
                child: DesignIcon.sunIcon(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
