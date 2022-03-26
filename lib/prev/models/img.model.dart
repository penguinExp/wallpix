
import 'img_src.model.dart';

class Img {
  int id;
  String url;
  Src src;

  Img({
    required this.id,
    required this.src,
    required this.url,
  });

  factory Img.fromJson(Map<String, dynamic> json) {
    return Img(
      id: json['id'],
      src: Src.fromJson(json['src']),
      url: json['url'],
    );
  }
}
