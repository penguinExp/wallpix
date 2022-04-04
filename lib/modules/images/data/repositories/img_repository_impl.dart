import 'package:dartz/dartz.dart';
import 'package:wallpix/core/errors/exception.core.dart';

import '../../../../core/core.dart';
import '../../domain/domain.images.dart';
import '../dataSource/img_data_source.data.dart';

typedef _GetSearchOrCurated = Future<List<ImgEntity>> Function();

class ImgRepositoryImpl implements ImgRepository {
  final ImageDataSource imageDataSource;
  final NetworkInfo networkInfo;

  ImgRepositoryImpl({
    required this.imageDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<ImgEntity>>> getCuratedImgs(
    int page,
  ) async {
    return await getDataFromSource(
      () => imageDataSource.getCuratedImgs(page),
    );
  }

  @override
  Future<Either<Failure, List<ImgEntity>>> searchImgs(
      String query, int page) async {
    return await getDataFromSource(
      () => imageDataSource.searchImgs(query, page),
    );
  }

  Future<Either<Failure, List<ImgEntity>>> getDataFromSource(
      _GetSearchOrCurated getSearchOrCurated) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await getSearchOrCurated();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectivityFailure());
    }
  }
}
