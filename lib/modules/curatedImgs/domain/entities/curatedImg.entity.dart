import 'package:equatable/equatable.dart';
import 'package:wallpix/modules/curatedImgs/domain/entities/curatedImg_links.entity.dart';
import 'package:wallpix/modules/curatedImgs/domain/entities/curatedImg_urls.entity.dart';

class CuratedImg extends Equatable {
  final String id;
  final int likes;
  final CuratedUrls urls;
  final CuratedLinks links;

  const CuratedImg({
    required this.urls,
    required this.links,
    required this.id,
    required this.likes,
  });

  @override
  List<Object?> get props => [id, urls, links, likes];
}
