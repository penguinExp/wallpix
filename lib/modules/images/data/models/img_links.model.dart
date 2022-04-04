import 'package:wallpix/modules/images/domain/domain.images.dart';

class ImageLinksModel extends ImgLinksEntity {
  const ImageLinksModel({
    required String download,
  }) : super(download: download);

  factory ImageLinksModel.fromJson(Map<String, dynamic> json) =>
      ImageLinksModel(
        download: json["download"],
      );
}
