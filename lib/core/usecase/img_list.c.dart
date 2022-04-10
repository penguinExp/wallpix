import 'package:wallpix/views/home/domain/entities/img.entity.dart';

class ImgListUseCaseContract {
  List<ImgEntity> imgs = [];
  int currentPage = 1;
  late int totalPages;
}
