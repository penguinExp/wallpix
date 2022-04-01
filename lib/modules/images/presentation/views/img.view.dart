import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpix/modules/images/presentation/bloc/imgs_bloc.dart';
import 'package:wallpix/modules/images/presentation/widgets/appbar_widget.images.dart';

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
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool _isAtBtm = _controller.position.pixels != 0;
        if (_isAtBtm) {
          BlocProvider.of<ImgsBloc>(context)
            .add(
              const GetCuratedImgsEvent(page: 2),
            );
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarWidget(),
          BlocProvider<ImgsBloc>(
            create: (_) => sl<ImgsBloc>()
              ..add(
                const GetCuratedImgsEvent(page: 1),
              ),
            child: _imgViewBodyWidget(),
          ),
        ],
      ),
    );
  }

  BlocBuilder<ImgsBloc, ImgsState> _imgViewBodyWidget() {
    return BlocBuilder<ImgsBloc, ImgsState>(
      builder: ((context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Loaded) {
          return _imglist(
            context: context,
            list: state.imgs,
            controller: _controller,
          );
        } else if (state is Error) {
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
