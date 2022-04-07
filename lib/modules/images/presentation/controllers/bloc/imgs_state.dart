part of 'imgs_bloc.dart';

abstract class ImgsState extends Equatable {
  const ImgsState();

  @override
  List<Object> get props => [];
}

class LoadingState extends ImgsState {}

class LoadingMoreState extends ImgsState {}

class LoadedState extends ImgsState {}

class LoadedMoreState extends ImgsState {}

class ErrorState extends ImgsState {
  final String errorMsg;

  const ErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}