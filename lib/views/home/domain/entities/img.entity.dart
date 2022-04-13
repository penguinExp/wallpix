import 'package:equatable/equatable.dart';

import 'img_links.entity.dart';
import 'img_urls.entity.dart';

export 'img_links.entity.dart';
export 'img_urls.entity.dart';


class ImgEntity extends Equatable {
  final String id;
  final String blurHash;
  final ImgUrlsEntity urls;
  final ImgLinksEntity links;

  const ImgEntity({
    required this.urls,
    required this.links,
    required this.id,
    required this.blurHash,
  });

  @override
  List<Object?> get props => [id, urls, links, blurHash];
}
