import 'package:wallpix/modules/images/data/models/img_links.model.dart';
import 'package:wallpix/modules/images/data/models/img_url.model.dart';
import 'package:wallpix/modules/images/domain/domain.images.dart';

class ImgModel extends ImgEntity {
  const ImgModel({
    required ImageUrlModels urls,
    required ImageLinksModel links,
    required String id,
    required int likes,
  }) : super(urls: urls, links: links, id: id, likes: likes);

  factory ImgModel.fromJson(Map<String, dynamic> json) => ImgModel(
        id: json["id"],
        urls: json["url"],
        links: json["links"],
        likes: json["likes"],
        // urls: urls(json["urls"]),
        // links: links.fromJson(json["links"]),
      );
}
