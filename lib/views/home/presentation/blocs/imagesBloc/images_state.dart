part of 'images_bloc.dart';

enum ImagesBlocStatus {
  initial,
  success,
  failure,
  loading,
}

class ImagesState extends Equatable {
  final ImagesBlocStatus status;
  final List<ImgEntity> images;
  final bool hasReachedEnd;
  final String errorMsg;
  final bool isSearching;

  const ImagesState({
    this.status = ImagesBlocStatus.initial,
    this.images = const <ImgEntity>[],
    this.hasReachedEnd = false,
    this.errorMsg = '',
    this.isSearching = false,
  });

  ImagesState copyWith({
    ImagesBlocStatus? status,
    List<ImgEntity>? images,
    bool? hasReachedEnd,
    String? errorMsg,
    bool? isSearching,
  }) {
    return ImagesState(
      status: status ?? this.status,
      images: images ?? this.images,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      errorMsg: errorMsg ?? this.errorMsg,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  String toString() {
    return '''ImagesState { status: $status, hasReachedEnd: $hasReachedEnd, images: ${images.length} , errorMsg: $errorMsg }, isSearching: $isSearching ''';
  }

  @override
  List<Object?> get props => [
        status,
        images,
        hasReachedEnd,
        errorMsg,
        isSearching,
      ];
}