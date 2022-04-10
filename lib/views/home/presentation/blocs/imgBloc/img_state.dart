part of 'img_bloc.dart';

abstract class ImgState extends Equatable {
  const ImgState();

  @override
  List<Object> get props => [];
}

class LoadingState extends ImgState {}

class LoadingMoreState extends ImgState {}

class LoadedState extends ImgState {
  final List<ImgEntity> imgList;

  const LoadedState({required this.imgList});

  @override
  List<Object> get props => [imgList];
}

class ErrorState extends ImgState {
  final String errorMsg;

  const ErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
