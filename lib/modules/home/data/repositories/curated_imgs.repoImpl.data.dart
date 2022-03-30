import 'package:wallpix/modules/home/data/datasources/curated_imgs_api.data.dart';
import 'package:wallpix/modules/home/data/models/img.model.dart';
import 'package:wallpix/core/errors/failures.errors.dart';
import 'package:dartz/dartz.dart';
import 'package:wallpix/modules/home/domain/repositories/curated_img.repo.domain.dart';
import 'package:http/http.dart' as http;

class CuratedImgsRepositoryImpl extends CuratedImgsRepository {
  @override
  Future<Either<FailureEntity, List<ImgModel>>> getCuratedImgs() async {
    final curatedImgsApi = CuratedImgsAPI(httpClient: http.Client());
    try {
      final curatedImgsList = await curatedImgsApi.getCuratedImgs();
      return Right(curatedImgsList);
    } on ServerFailure {
      return const Left(ServerFailure());
    } on DataParsingFailure {
      return const Left(DataParsingFailure());
    } on NoConnectionFailure {
      return const Left(NoConnectionFailure());
    }
  }
}
