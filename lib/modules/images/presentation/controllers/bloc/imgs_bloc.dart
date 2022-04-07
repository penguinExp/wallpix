import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wallpix/core/core.dart';
import 'package:wallpix/modules/images/domain/domain.images.dart';

part 'imgs_event.dart';
part 'imgs_state.dart';

const String _serverFailure = 'Server error occured';
const String _dataParsingFailure =
    'There is an error occured while getting the data from the server/API. Please consider updating the WallPix';
const String _connectityFailure =
    "Hey👋, It seems you lost 😵 your internet connection";
const String _searchFailure =
    "WallPix couldn’t find anything for “Xyzzffsczsf”. Try to refine your search.";

class ImgsBloc extends Bloc<ImgsEvent, ImgsState> {
  final GetCuratedImgs getCuratedImgs;
  final SearchImgs searchImgs;
  final List<ImgEntity> imgsList = ImgsList.imgsList;

  ImgsBloc({
    required this.getCuratedImgs,
    required this.searchImgs,
  }) : super(LoadingState()) {
    on<GetCuratedImgsEvent>(
      (event, emit) async {
        emit(LoadingState());
        final failureOrImgs =
            await getCuratedImgs(CuratedParms(page: event.page));
        _eitherFoldOfErrOrImgs(failureOrImgs, emit);
      },
    );
    on<SearchImgsEvent>(
      (event, emit) async {
        emit(LoadingState());
        final failureOrImgs = await searchImgs(
            SearchParams(query: event.query, page: event.page));
        _eitherFoldOfErrOrImgs(failureOrImgs, emit);
      },
    );
  }

  void _eitherFoldOfErrOrImgs(
      Either<Failure, List<ImgEntity>> failureOrImgs, Emitter<ImgsState> emit) {
    failureOrImgs.fold(
        (failure) => emit(
              ErrorState(
                errorMsg: mapFailureToMsg(failure),
              ),
            ), (imgs) {
      imgsList.addAll(imgs);
      emit(LoadedState());
    });
  }

  String mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return _serverFailure;
      case DataParsingFailure:
        return _dataParsingFailure;
      case ConnectivityFailure:
        return _connectityFailure;
      case SearchFailure:
        return _searchFailure;
      default:
        return 'Unexcepted Failure :(';
    }
  }
}
