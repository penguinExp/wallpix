import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpix/views/home/presentation/blocs/imagesBloc/images_bloc.dart';
import '../../../../designs/text_field.designs.dart';

import '../../../../designs/designs.e.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({Key? key}) : super(key: key);

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  double currentOffset = 0;

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_isAtBottom) {
      // log('message');
      // context.read<ImagesBloc>().state.copyWith(query: textController.text);
      context.read<ImagesBloc>().add(ImagesFetched());
    }
  }

  bool get _isAtBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    textController.dispose();
    scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DesignTextField(
          isFocused: true,
          textEditingController: textController,
          hintTxt: 'Search WallPix',
          highLightColor: Theme.of(context).colorScheme.onPrimary,
          secBgColor: Theme.of(context).colorScheme.onBackground,
          suffixIcon: DesignIcon.searchIcon(
            color: Theme.of(context).primaryColor,
          ),
          onIconTap: () {
            context
                .read<ImagesBloc>()
                .state
                .copyWith(query: textController.text);
            context.read<ImagesBloc>().add(ImagesFetched());
            log(textController.text);
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        Flexible(
          child: BlocBuilder<ImagesBloc, ImagesState>(
            builder: (context, state) {
              switch (state.status) {
                case ImagesBlocStatus.success:
                  if (state.query.isNotEmpty && state.images.isEmpty) {
                    return Center(
                      child: DesignText.headingFourSemiBold(
                        text:
                            "WallPix couldn’t find anything for “${state.query}”.Try to refine your search.",
                      ),
                    );
                  } else if (state.images.isEmpty) {
                    return Center(
                      child: DesignText.headingFourSemiBold(
                        text:
                            "WallPix got into an wired error, Please try again later!",
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: _imgListView(state),
                    );
                  }
                case ImagesBlocStatus.failure:
                  return Center(
                    child: DesignText.headingFourSemiBold(
                      text: state.errMsg,
                    ),
                  );
                default:
                  return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }

  MasonryGridView _imgListView(ImagesState state) {
    return MasonryGridView.count(
      controller: scrollController,
      crossAxisSpacing: 20.w,
      mainAxisSpacing: 20.h,
      crossAxisCount: kIsWeb ? 3 : 2,
      itemCount: state.images.length,
      itemBuilder: (context, i) {
        return GridTile(
          child: GestureDetector(
            onTap: (() {}),
            child: Hero(
              tag: state.images[i].id,
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: FadeInImage.memoryNetwork(
                    fit: BoxFit.contain,
                    placeholder: kTransparentImage,
                    image: state.images[i].urls.regular,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
