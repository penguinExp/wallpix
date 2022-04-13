import 'package:wallpix/views/home/domain/entities/img.entity.dart';

class ImgLinksModel extends ImgLinksEntity {
  const ImgLinksModel({
    required String download,
  }) : super(download: download);

  factory ImgLinksModel.fromJson(Map<String, dynamic> json) => ImgLinksModel(
        download: json["download"],
      );
}
