part of 'images_bloc.dart';

enum ImagesBlocStatus {
  initial,
  success,
  failure,
}

class ImagesState extends Equatable {
  final ImagesBlocStatus status;
  final List<ImgEntity> images;
  final bool hasReachedEnd;
  final String query;
  final int page;
  final String errMsg;

  const ImagesState({
    this.status = ImagesBlocStatus.initial,
    this.images = const <ImgEntity>[],
    this.hasReachedEnd = false,
    this.query = '',
    this.page = 1,
    this.errMsg = '',
  });

  ImagesState copyWith({
    ImagesBlocStatus? status,
    List<ImgEntity>? images,
    bool? hasReachedEnd,
    int? page,
    String? query,
    String? errMsg,
  }) {
    return ImagesState(
      status: status ?? this.status,
      images: images ?? this.images,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      page: page ?? this.page,
      query: query ?? this.query,
      errMsg: errMsg ?? this.errMsg,
    );
  }

  @override
  String toString() {
    return '''ImagesState { status: $status, hasReachedEnd: $hasReachedEnd, images: ${images.length} , page: $page, query: $query, errMsg: $errMsg }''';
  }

  @override
  List<Object?> get props => [
        status,
        images,
        hasReachedEnd,
        page,
        query,
        errMsg,
      ];
}
