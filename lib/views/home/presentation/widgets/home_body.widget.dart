import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpix/views/home/domain/domain.e.dart';
import 'package:wallpix/views/home/presentation/blocs/imgBloc/img_bloc.dart';
import '../../../../designs/text_field.designs.dart';
import 'package:wallpix/injection_container.dart' as sl;

import '../../../../designs/designs.e.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({Key? key}) : super(key: key);

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  final TextEditingController controller = TextEditingController();

  final List<ImgEntity> imagesList = sl.imgListUseCaseContract.imgs;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
      ),
      child: Column(
        children: [
          DesignTextField(
            isFocused: true,
            textEditingController: controller,
            hintTxt: 'Search WallPix',
            highLightColor: Theme.of(context).colorScheme.onPrimary,
            secBgColor: Theme.of(context).colorScheme.onBackground,
            suffixIcon: DesignIcon.searchIcon(
              color: Theme.of(context).primaryColor,
            ),
            onIconTap: () {
              // log("message");
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Flexible(
            child: BlocBuilder<ImgBloc, ImgState>(
              builder: (context, state) {
                if (state is LoadedState) {
                  return SizedBox(
                    child: Column(
                      children: [
                        Expanded(
                          child: MasonryGridView.count(
                            crossAxisSpacing: 20.w,
                            mainAxisSpacing: 20.h,
                            crossAxisCount: kIsWeb ? 3 : 2,
                            itemCount: state.imgList.length,
                            itemBuilder: (context, i) {
                              return GridTile(
                                child: GestureDetector(
                                  onTap: (() {}),
                                  child: Hero(
                                    tag: state.imgList[i].id,
                                    child: SizedBox(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: FadeInImage.memoryNetwork(
                                          fit: BoxFit.contain,
                                          placeholder: kTransparentImage,
                                          image: state.imgList[i].urls.small,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        (state is LoadingMoreState)
                            ? const LoaderAnimationWidget()
                            : Container()
                      ],
                    ),
                  );
                } else if (state is LoadingState) {
                  return const Center(
                    child: LoaderAnimationWidget(),
                  );
                } else {
                  return const Center(
                    child: Text('Oh! Something went wrong'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
