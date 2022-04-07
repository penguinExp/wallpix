import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpix/core/core.dart';
import 'package:wallpix/modules/images/domain/domain.images.dart';
import 'package:wallpix/modules/images/injection_container.images.dart' as di;
import 'package:wallpix/modules/images/presentation/controllers/bloc/imgs_bloc.dart';

import '../../../../designs/designs.design.dart';

class ImgsListViewBody extends StatefulWidget {
  const ImgsListViewBody({Key? key}) : super(key: key);

  @override
  State<ImgsListViewBody> createState() => _ImgsListViewBodyState();
}

class _ImgsListViewBodyState extends State<ImgsListViewBody> {
  final ScrollController _controller = ScrollController();
  int page = 1;
  final List<ImgEntity> imgs = ImgsList.imgsList;

  @override
  void initState() {
    di.init();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        page++;
        log(page.toString());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImgsBloc, ImgsState>(
      builder: ((context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedState) {
          return _imglist(
            context: context,
            list: imgs,
            controller: _controller,
          );
        } else if (state is ErrorState) {
          return Center(
            child: DesignText.headingThree(text: state.errorMsg),
          );
        } else {
          return Center(
            child: DesignText.headingThree(text: 'Some thing went wrong'),
          );
        }
      }),
    );
  }
}

GridView _imglist({
  required BuildContext context,
  required List<ImgEntity> list,
  required ScrollController controller,
}) {
  return GridView.count(
    controller: controller,
    crossAxisCount: 2,
    mainAxisSpacing: 20,
    childAspectRatio: MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height / 1.5),
    physics: const ClampingScrollPhysics(),
    children: list.map((img) {
      return GridTile(
        child: GestureDetector(
          onTap: (() {}),
          child: Hero(
            tag: img.id,
            child: SizedBox(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: FadeInImage.memoryNetwork(
                  fit: BoxFit.contain,
                  placeholder: kTransparentImage,
                  image: img.urls.small,
                ),
              ),
            ),
          ),
        ),
      );
    }).toList(),
  );
}
