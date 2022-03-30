import 'img_src.model.dart';

class ImgModel {
  int id;
  String url;
  SrcModel src;

  ImgModel({
    required this.id,
    required this.src,
    required this.url,
  });

  factory ImgModel.fromJson(Map<String, dynamic> json) {
    return ImgModel(
      id: json['id'],
      src: SrcModel.fromJson(json['src']),
      url: json['url'],
    );
  }
}
