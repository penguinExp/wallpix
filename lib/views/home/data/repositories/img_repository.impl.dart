import 'package:wallpix/core/core.e.dart';
import 'package:dartz/dartz.dart';
import 'package:wallpix/core/services/network_connectivity.service.dart';
import 'package:wallpix/views/home/data/datasource/img_data_source.impl.dart';
import 'package:wallpix/views/home/domain/domain.e.dart';

typedef _GetSearchCuratedOrMore = Future<List<ImgEntity>> Function();

class ImgRepositoryImpl implements ImgRepository {
  final ImgDataSourceImpl imgDataSource;
  final NetWorkInfoImpl networkInfo;

  ImgRepositoryImpl({
    required this.imgDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<CustomFailure, List<ImgEntity>>> getCuratedImgs() async {
    return await _getImgFromDataSource(
      getSearchCuratedOrMore: () => imgDataSource.getCuratedImg(),
    );
  }

  @override
  Future<Either<CustomFailure, List<ImgEntity>>> getImgsFromNextPage(
      {required int currentPage, String? query}) async {
    return await _getImgFromDataSource(
      getSearchCuratedOrMore: () => imgDataSource.getImgFromNextPage(
        currentPage: currentPage,
        query: query,
      ),
    );
  }

  @override
  Future<Either<CustomFailure, List<ImgEntity>>> searchImgs(
      {required String query}) async {
    return await _getImgFromDataSource(
      getSearchCuratedOrMore: () => imgDataSource.searchImg(query: query),
    );
  }

  Future<Either<CustomFailure, List<ImgEntity>>> _getImgFromDataSource(
      {required _GetSearchCuratedOrMore getSearchCuratedOrMore}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await getSearchCuratedOrMore();
        return Right(result);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectivityFailure());
    }
  }
}
