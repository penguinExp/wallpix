import 'package:wallpix/views/home/domain/entities/img.entity.dart';

class ImgUrlsModel extends ImgUrlsEntity {
  const ImgUrlsModel({
    required String full,
    required String regular,
    required String small,
  }) : super(
          full: full,
          regular: regular,
          small: small,
        );

  factory ImgUrlsModel.fromJson(Map<String, dynamic> json) => ImgUrlsModel(
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
      );
}
