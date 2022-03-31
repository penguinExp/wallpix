import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wallpix/core/core.dart';
import 'package:wallpix/modules/images/domain/domain.images.dart';

part 'imgs_event.dart';
part 'imgs_state.dart';

const String serverFailure = 'Server error occured';
const String dataParsingFailure =
    'There is an error occured while getting the data from the server/API. Please consider updating the WallPix';
const String connectityFailure =
    "Hey👋, It seems you lost 😵 your internet connection";
const String searchFailure =
    "WallPix couldn’t find anything for “Xyzzffsczsf”. Try to refine your search.";

class ImgsBloc extends Bloc<ImgsEvent, ImgsState> {
  final GetCuratedImgs getCuratedImgs;
  final SearchImgs searchImgs;

  ImgsBloc({
    required this.getCuratedImgs,
    required this.searchImgs,
  }) : super(Empthy()) {
    on<GetCuratedImgsEvent>(
      (event, emit) async {
        final failureOrImgs = await getCuratedImgs(const CuratedParms(page: 1));
        failureOrImgs.fold(
          (failure) => UnimplementedError(),
          (imgs) => Loaded(imgs: imgs),
        );
      },
    );
    on<SearchImgsEvent>(
      (event, emit) {},
    );
  }

  // ImgsBloc() : super(Empthy()) {
  //   on<ImgsEvent>((event, emit) {});
  // }
}
