part of 'imgs_bloc.dart';

abstract class ImgsState extends Equatable {
  const ImgsState();

  @override
  List<Object> get props => [];
}

class Loading extends ImgsState {}

class Loaded extends ImgsState {
  final List<ImgEntity> imgs;

  const Loaded({required this.imgs});

  @override
  List<Object> get props => [imgs];
}

class LoadMore extends ImgsState {
  final List<ImgEntity> imgs;

  const LoadMore({required this.imgs});

  @override
  List<Object> get props => [imgs];
}

class Error extends ImgsState {
  final String errorMsg;

  const Error({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
