import 'package:dartz/dartz.dart';
import 'package:wallpix/core/errors/failures.errors.dart';
import 'package:wallpix/modules/home/data/models/img.model.dart';

abstract class CuratedImgsRepository {
  Future<Either<FailureEntity, List<ImgModel>>> getCuratedImgs();
}
