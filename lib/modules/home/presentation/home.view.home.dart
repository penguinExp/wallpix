import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpix/modules/home/controllers/curatedImgsBloc/curatedimgs_bloc.dart';
import 'package:wallpix/modules/home/data/repositories/curated_imgs.repoImpl.data.dart';

import '../../../designs/designs.design.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MultiBlocProvider(
            providers: [
              BlocProvider<CuratedimgsBloc>(
                create: (BuildContext context) => CuratedimgsBloc(
                  curatedImgsRepository: CuratedImgsRepositoryImpl(),
                )..add(const LoadCuratedImgsList()),
              )
            ],
            child: BlocBuilder<CuratedimgsBloc, CuratedimgsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loadSuccess: (imgsList) => GridView.count(
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
                    children: imgsList.map((img) {
                      return GridTile(
                        child: GestureDetector(
                          onTap: (() {}),
                          child: Hero(
                            tag: img.id,
                            child: SizedBox(
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: FadeInImage.memoryNetwork(
                                    fit: BoxFit.contain,
                                    placeholder: kTransparentImage,
                                    image: img.src.portrait),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  loadFailure: (errorObj) => Center(
                    child: Column(
                      children: [
                        Text(errorObj.title),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(errorObj.msg)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}