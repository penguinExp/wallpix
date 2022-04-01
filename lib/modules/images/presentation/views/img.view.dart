import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpix/modules/images/presentation/bloc/imgs_bloc.dart';

import '../../../../designs/designs.design.dart';
import '../../domain/domain.images.dart';
import '../../injection_container.images.dart';

class ImgView extends StatefulWidget {
  const ImgView({Key? key}) : super(key: key);

  @override
  State<ImgView> createState() => _ImgViewState();
}

class _ImgViewState extends State<ImgView> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ImgsBloc>(
        create: (_) => sl<ImgsBloc>()
          ..add(
            const GetCuratedImgsEvent(page: 1),
          ),
        child: BlocBuilder<ImgsBloc, ImgsState>(
          builder: ((context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Loaded) {
              return _imglist(context, state.imgs);
            } else if (state is Error) {
              return DesignText.headingThree(text: state.errorMsg);
            } else {
              return DesignText.headingThree(text: 'Some thing went wrong');
            }
          }),
        ),
      ),
    );
  }

  GridView _imglist(BuildContext context, List<ImgEntity> list) {
    return GridView.count(
      // padding: const EdgeInsets.symmetric(
      //   horizontal: 30,
      // ),
      crossAxisCount: 2,
      // shrinkWrap: true,
      // crossAxisSpacing: 0.1,
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
                    image: img.urls.full,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
