// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:wallpix/views/home/domain/domain.e.dart';
// import 'package:wallpix/views/home/presentation/blocs/imgBloc/img_bloc.dart';
// import '../../../../designs/text_field.designs.dart';
// import 'package:wallpix/injection_container.dart' as sl;

// import '../../../../designs/designs.e.dart';

// class HomeBodyWidget extends StatefulWidget {
//   const HomeBodyWidget({Key? key}) : super(key: key);

//   @override
//   State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
// }

// class _HomeBodyWidgetState extends State<HomeBodyWidget> {
//   final TextEditingController controller = TextEditingController();
//   final ScrollController scrollController = ScrollController();

//   final List<ImgEntity> imagesList = sl.imgListUseCaseContract.imgs;

//   double currentOffset = 0;

//   @override
//   void initState() {
//     scrollController.addListener(() {
//       if (scrollController.position.maxScrollExtent ==
//           scrollController.position.pixels) {
//         currentOffset = scrollController.offset;
//         BlocProvider.of<ImgBloc>(context).add(GetMoreImgEvent(
//           currentPage: sl.imgListUseCaseContract.currentPage,
//         ));
//         setState(() {});
//       }
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DesignTextField(
//           isFocused: true,
//           textEditingController: controller,
//           hintTxt: 'Search WallPix',
//           highLightColor: Theme.of(context).colorScheme.onPrimary,
//           secBgColor: Theme.of(context).colorScheme.onBackground,
//           suffixIcon: DesignIcon.searchIcon(
//             color: Theme.of(context).primaryColor,
//           ),
//           onIconTap: () {},
//         ),
//         SizedBox(
//           height: 20.h,
//         ),
//         Flexible(
//           child: BlocBuilder<ImgBloc, ImgState>(
//             builder: (context, state) {
//               if (state is LoadedState) {
//                 return Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 30.w,
//                   ),
//                   child: _imgListView(state),
//                 );
//               } else if (state is LoadingState) {
//                 return const Center(
//                   child: LoaderAnimationWidget(),
//                 );
//               } else if (state is ErrorState) {
//                 return Center(
//                   child: DesignText.headingFourSemiBold(
//                       text: state.errorMsg,
//                       color: Theme.of(context).primaryColor),
//                 );
//               } else {
//                 return Center(
//                   child: DesignText.headingFourSemiBold(
//                       text: 'Oh! Something went wrong',
//                       color: Theme.of(context).primaryColor),
//                 );
//               }
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Column _imgListView(LoadedState state) {
//     scrollController.animateTo(
//       currentOffset,
//       duration: const Duration(seconds: 2),
//       curve: Curves.fastOutSlowIn,
//     );

//     return Column(
//       children: [
//         Expanded(
//           child: MasonryGridView.count(
//             controller: scrollController,
//             crossAxisSpacing: 20.w,
//             mainAxisSpacing: 20.h,
//             crossAxisCount: kIsWeb ? 3 : 2,
//             itemCount: sl.imgListUseCaseContract.imgs.length,
//             itemBuilder: (context, i) {
//               return GridTile(
//                 child: GestureDetector(
//                   onTap: (() {}),
//                   child: Hero(
//                     tag: sl.imgListUseCaseContract.imgs[i].id,
//                     child: SizedBox(
//                       child: ClipRRect(
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(10)),
//                         child: FadeInImage.memoryNetwork(
//                           fit: BoxFit.contain,
//                           placeholder: kTransparentImage,
//                           image: sl.imgListUseCaseContract.imgs[i].urls.small,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         (state is LoadingMoreState)
//             ? const LoaderAnimationWidget()
//             : Container()
//       ],
//     );
//   }
// }
