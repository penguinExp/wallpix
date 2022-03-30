import 'dart:convert';

import 'img_links.model.dart';
import 'img_url.model.dart';

class Img {
  Img({
    required this.id,
    required this.urls,
    required this.links,
    required this.likes,
  });

  String id;
  Urls urls;
  Links links;
  int likes;

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        id: json["id"],
        urls: Urls.fromJson(json["urls"]),
        links: Links.fromJson(json["links"]),
        likes: json["likes"],
      );

  static Img imgFromJson(String str) => Img.fromJson(json.decode(str));
}
