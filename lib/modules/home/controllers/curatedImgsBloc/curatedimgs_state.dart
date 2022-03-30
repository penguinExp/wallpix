part of 'curatedimgs_bloc.dart';

@freezed
class CuratedimgsState with _$CuratedimgsState {
  const factory CuratedimgsState.initial() = _Initial;

  const factory CuratedimgsState.loadSuccess({
    required List<ImgModel> curatedImgs,
  }) = LoadSuccess;
  
  const factory CuratedimgsState.loadFailure({
    required ErrorObject errorObject,
  }) = LoadFailure;
}
