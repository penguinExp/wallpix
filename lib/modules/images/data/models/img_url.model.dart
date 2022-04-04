import 'package:wallpix/modules/images/domain/domain.images.dart';

class ImageUrlModels extends ImgUrlsEntity {
  const ImageUrlModels({
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
            smallS3: smallS3);

  factory ImageUrlModels.fromJson(Map<String, dynamic> json) => ImageUrlModels(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        smallS3: json["small_s3"],
      );
}
