import 'package:flutter/foundation.dart';
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
  Future<Either<CustomFailure, List<ImgEntity>>> getCuratedImgs({
    required int page,
  }) async {
    return await _getImgFromDataSource(
      getSearchCuratedOrMore: () => imgDataSource.getCuratedImg(page: page),
    );
  }

  @override
  Future<Either<CustomFailure, List<ImgEntity>>> searchImgs({
    required String query,
    required int page,
  }) async {
    return await _getImgFromDataSource(
      getSearchCuratedOrMore: () => imgDataSource.searchImg(
        query: query,
        page: page,
      ),
    );
  }

  Future<Either<CustomFailure, List<ImgEntity>>> _getImgFromDataSource(
      {required _GetSearchCuratedOrMore getSearchCuratedOrMore}) async {
    if (kIsWeb) {
      try {
        final result = await getSearchCuratedOrMore();
        return Right(result);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else if (await networkInfo.isConnected) {
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
