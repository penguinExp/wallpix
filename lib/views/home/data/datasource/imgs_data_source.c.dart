import 'package:wallpix/views/home/domain/entities/img.entity.dart';

abstract class ImgsDataSource {
  Future<List<ImgEntity>> getCuratedImg();
  Future<List<ImgEntity>> searchImg({required String query});
  Future<List<ImgEntity>> getImgFromNextPage({required int currentPage});
}