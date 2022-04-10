import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wallpix/core/core.e.dart';
import 'package:wallpix/views/home/domain/domain.e.dart';

part 'img_event.dart';
part 'img_state.dart';

class ImgBloc extends Bloc<ImgEvent, ImgState> {
  final GetCuratedImgUseCaseImpl getCuratedImgUseCase;
  final GetMoreImgUseCaseImpl getMoreImgUseCase;
  final SearchImgUseCaseImpl searchImgUseCase;
  final ImgListUseCaseContract imgListUseCaseContract;
  ImgBloc({
    required this.getCuratedImgUseCase,
    required this.getMoreImgUseCase,
    required this.searchImgUseCase,
    required this.imgListUseCaseContract,
  }) : super(LoadingState()) {
    on<GetCuratedImgEvent>((event, emit) async {
      emit(LoadingState());
      final failureOrImages =
          await getCuratedImgUseCase(CuratedImgParameters());
      _eitherFoldOfErrOrImgs(failureOrImages, emit);
    });
    on<SearchImgEvent>((event, emit) async {
      emit(LoadingState());
      final failureOrImages =
          await searchImgUseCase(SearchImgParameters(query: event.query));
      _eitherFoldOfErrOrImgs(failureOrImages, emit);
    });
    on<GetMoreImgEvent>(
      (event, emit) async {
        emit(LoadingMoreState());
        final failureOrImages = await getMoreImgUseCase(
            GetMoreImgParameters(currentPage: event.currentPage));
        _eitherFoldOfErrOrImgs(failureOrImages, emit);
      },
    );
  }

  void _eitherFoldOfErrOrImgs(
      Either<CustomFailure, List<ImgEntity>> failureOrImages,
      Emitter<ImgState> emit) {
    failureOrImages.fold(
        (failure) => emit(
              ErrorState(
                errorMsg: _mapFailureToMsg(failure),
              ),
            ), (images) {
      emit(LoadedState(imgList: images));
    });
  }

  String _mapFailureToMsg(CustomFailure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return _serverFailure;
      case DataParsingFailure:
        return _dataParsingFailure;
      case ConnectivityFailure:
        return _connectivityFailure;
      default:
        return 'Unexpected Failure :(';
    }
  }

  final String _serverFailure = 'Server error occurred';
  final String _dataParsingFailure =
      'There is an error occurred while getting the data from the server/API. Please consider updating the WallPix';
  final String _connectivityFailure =
      "Hey👋, It seems you lost 😵 your internet connection";
}