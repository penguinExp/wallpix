import 'package:dartz/dartz.dart';
import 'package:wallpix/core/errors/custom_failure.c.dart';
import 'package:wallpix/views/home/domain/entities/img.entity.dart';

abstract class ImgRepository {
  Future<Either<CustomFailure, List<ImgEntity>>> searchImgs(
      {required String query});
  Future<Either<CustomFailure, List<ImgEntity>>> getCuratedImgs();
  Future<Either<CustomFailure, List<ImgEntity>>> getImgsFromNextPage({required int currentPage});
}