import 'package:wallpix/views/home/data/models/img_links.model.dart';
import 'package:wallpix/views/home/data/models/img_urls.model.dart';
import 'package:wallpix/views/home/domain/entities/img.entity.dart';

class ImgModel extends ImgEntity {
  const ImgModel({
    required ImgUrlsModel urls,
    required ImgLinksModel links,
    required String id,
    required int likes,
  }) : super(urls: urls, links: links, id: id, likes: likes);

  factory ImgModel.fromJson(Map<String, dynamic> json) => ImgModel(
        id: json["id"],
        urls: ImgUrlsModel.fromJson(json['urls']),
        links: ImgLinksModel.fromJson(json['links']),
        likes: json["likes"],
      );
}
