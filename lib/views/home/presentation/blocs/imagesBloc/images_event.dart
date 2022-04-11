part of 'images_bloc.dart';

abstract class ImagesEvent extends Equatable {
  const ImagesEvent();

  @override
  List<Object> get props => [];
}

/// This gets called  when the UI layer need more Images to show
class ImagesFetched extends ImagesEvent {}