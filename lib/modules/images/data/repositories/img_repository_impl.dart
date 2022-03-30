import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/domain.images.dart';
import '../dataSource/img_data_source.data.dart';

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
    networkInfo.isConnected;
    final result = await imageDataSource.getCuratedImgs(page);
    return Right(result);
  }

  @override
  Future<Either<Failure, List<ImgEntity>>> searchImgs(
      String query, int page) async {
    networkInfo.isConnected;
    final result = await imageDataSource.searchImgs(query, page);
    return Right(result);
  }
}