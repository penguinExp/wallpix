// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import 'package:wallpix/views/home/presentation/blocs/imgBloc/img_bloc.dart';
// import 'package:wallpix/views/home/presentation/blocs/themeCubit/theme_cubit.dart';
// import 'package:wallpix/views/home/presentation/home.view.dart';
// import 'package:wallpix/views/splash/splash.view.dart';

// import '../../injection_container.dart' as sl;

// class WallPixPages {
//   static List<GetPage> getViews = [
//     GetPage(
//       name: '/',
//       page: () => const SplashView(),
//     ),
//     GetPage(
//       name: '/home',
//       page: () => MultiBlocProvider(
//         providers: [
//           BlocProvider(
//             create: (_) => ThemeCubit(),
//           ),
//           BlocProvider(
//             create: (_) => sl.sl<ImgBloc>()
//               ..add(
//                 GetCuratedImgEvent(),
//               ),
//           )
//         ],
//         child: const HomeView(),
//       ),
//     ),
//   ];
// }
