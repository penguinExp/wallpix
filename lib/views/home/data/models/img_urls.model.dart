import 'package:wallpix/views/home/domain/entities/img.entity.dart';

class ImgUrlsModel extends ImgUrlsEntity {
  const ImgUrlsModel({
    required String raw,
    required String full,
    required String regular,
    required String small,
    required String smallS3,
  }) : super(
          raw: raw,
          full: full,
          regular: regular,
          small: small,
          smallS3: smallS3,
        );

  factory ImgUrlsModel.fromJson(Map<String, dynamic> json) => ImgUrlsModel(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        smallS3: json["small_s3"],
      );
}