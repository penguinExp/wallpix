import 'package:wallpix/core/errors/custom_failure.c.dart';
import 'package:dartz/dartz.dart';
import 'package:wallpix/core/usecase/img_usecase.c.dart';
import 'package:wallpix/views/home/data/repositories/img_repository.impl.dart';
import 'package:wallpix/views/home/domain/entities/img.entity.dart';

class GetMoreImgUseCaseImpl
    implements ImgUsecase<List<ImgEntity>, GetMoreImgParameters> {
  final ImgRepositoryImpl imgRepository;

  GetMoreImgUseCaseImpl({required this.imgRepository});

  @override
  Future<Either<CustomFailure, List<ImgEntity>>> call(
      GetMoreImgParameters parameters) {
    return imgRepository.getImgsFromNextPage(
        currentPage: parameters.currentPage);
  }
}