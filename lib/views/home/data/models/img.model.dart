import 'package:wallpix/views/home/data/models/img_links.model.dart';
import 'package:wallpix/views/home/data/models/img_urls.model.dart';
import 'package:wallpix/views/home/domain/entities/img.entity.dart';

class ImgModel extends ImgEntity {
  const ImgModel({
    required ImgUrlsModel urls,
    required ImgLinksModel links,
    required String id,
    required String blurHash,
  }) : super(
          urls: urls,
          links: links,
          id: id,
          blurHash: blurHash,
        );

  factory ImgModel.fromJson(Map<String, dynamic> json) => ImgModel(
        id: json["id"],
        urls: ImgUrlsModel.fromJson(json['urls']),
        links: ImgLinksModel.fromJson(json['links']),
        blurHash: json["blur_hash"],
      );
}
