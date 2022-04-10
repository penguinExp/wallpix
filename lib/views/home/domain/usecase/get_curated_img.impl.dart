import 'package:wallpix/core/errors/custom_failure.c.dart';
import 'package:dartz/dartz.dart';
import 'package:wallpix/core/usecase/img_usecase.c.dart';
import 'package:wallpix/views/home/domain/entities/img.entity.dart';
import 'package:wallpix/views/home/domain/repositories/img.repository.dart';

class GetCuratedImgUseCaseImpl
    implements ImgUsecase<List<ImgEntity>, CuratedImgParameters> {
  final ImgRepository imgRepository;

  GetCuratedImgUseCaseImpl({required this.imgRepository});

  @override
  Future<Either<CustomFailure, List<ImgEntity>>> call(
      CuratedImgParameters parameters) {
    return imgRepository.getCuratedImgs();
  }
}
