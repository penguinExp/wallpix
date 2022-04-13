import 'package:wallpix/views/home/domain/entities/img.entity.dart';

abstract class ImgDataSource {
  Future<List<ImgEntity>> getCuratedImg({
    required int page,
  });
  Future<List<ImgEntity>> searchImg({
    required String query,
    required int page,
  });
}
