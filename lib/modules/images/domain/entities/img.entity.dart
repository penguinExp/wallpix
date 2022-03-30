import 'package:equatable/equatable.dart';

import '../domain.images.dart';

class ImgEntity extends Equatable {
  final String id;
  final int likes;
  final ImgUrlsEntity urls;
  final ImgLinksEntity links;

  const ImgEntity({
    required this.urls,
    required this.links,
    required this.id,
    required this.likes,
  });

  @override
  List<Object?> get props => [id, urls, links, likes];
}
