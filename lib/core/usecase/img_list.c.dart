import 'package:wallpix/views/home/domain/entities/img.entity.dart';

abstract class ImgListUseCaseContract {
  late List<ImgEntity> imgs;
  late int currentPage;
  late int totalPages;
}
