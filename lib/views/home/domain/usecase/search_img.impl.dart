import 'package:wallpix/core/errors/custom_failure.c.dart';
import 'package:dartz/dartz.dart';
import 'package:wallpix/core/usecase/img_usecase.c.dart';
import 'package:wallpix/views/home/data/repositories/img_repository.impl.dart';
import 'package:wallpix/views/home/domain/entities/img.entity.dart';

class SearchImgUseCaseImpl
    implements ImgUsecase<List<ImgEntity>, SearchImgParameters> {
  final ImgRepositoryImpl imgRepository;

  SearchImgUseCaseImpl({required this.imgRepository});

  @override
  Future<Either<CustomFailure, List<ImgEntity>>> call(
      SearchImgParameters parameters) {
    return imgRepository.searchImgs(
      query: parameters.query,
      page: parameters.page,
    );
  }
}
