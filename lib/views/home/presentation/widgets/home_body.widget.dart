import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:wallpix/views/home/presentation/blocs/imagesBloc/images_bloc.dart';
import 'package:wallpix/views/home/presentation/widgets/components/search_bar.widget.dart';
import 'package:wallpix/views/home/presentation/widgets/components/topics_widget.dart';
import 'package:wallpix/views/img/image_view.dart';

import '../../../../designs/designs.e.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({Key? key}) : super(key: key);

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  int page = 1;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_isAtBottom) {
      debounce(() {
        log('getting more images');
        context.read<ImagesBloc>().add(
              ImagesFetched(
                query: textController.text,
                page: page + 1,
              ),
            );
      });
    }
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(
      seconds: 3,
    ),
  }) {
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer(duration, callback);
  }

  bool get _isAtBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
    scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarWidget(
          textController: textController,
          page: page,
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          height: 100.h,
          child: TopicsWidget(
            controller: textController,
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        Flexible(
          child: BlocBuilder<ImagesBloc, ImagesState>(
            builder: (context, state) {
              switch (state.status) {
                case ImagesBlocStatus.success:
                  if (textController.text.isNotEmpty && state.images.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: DesignText.headingFourSemiBold(
                          text:
                              "WallPix couldn’t find anything for “${textController.text}”.Try to refine your search.",
                        ),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: _imgListView(state),
                          ),
                          (state.status == ImagesBlocStatus.loading)
                              ? Center(
                                  child: Container(
                                      margin: EdgeInsets.only(
                                        top: 10.h,
                                      ),
                                      child: const CircularProgressIndicator()),
                                )
                              : Container()
                        ],
                      ),
                    );
                  }
                case ImagesBlocStatus.failure:
                  return Center(
                    child: DesignText.headingFourSemiBold(
                      text: state.errorMsg,
                    ),
                  );
                default:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
              }
            },
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  MasonryGridView _imgListView(ImagesState state) {
    return MasonryGridView.count(
      controller: scrollController,
      // shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      crossAxisSpacing: 20.w,
      mainAxisSpacing: 20.h,
      crossAxisCount: kIsWeb ? 3 : 2,
      itemCount: state.images.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, i) {
        return GridTile(
          child: GestureDetector(
            onTap: (() {
              Get.to(
                () => ImageView(
                  id: state.images[i].id,
                  downloadLink: state.images[i].links.download,
                  imageUrl: state.images[i].urls.full,
                  blurHash: state.images[i].blurHash,
                ),
              );
            }),
            child: Hero(
              tag: state.images[i].id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: DesignImage(
                  imageUrl: state.images[i].urls.small,
                  blurHash: state.images[i].blurHash,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
