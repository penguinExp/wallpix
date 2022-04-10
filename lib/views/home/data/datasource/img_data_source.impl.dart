import 'dart:convert';

import 'package:wallpix/core/core.e.dart';
import 'package:wallpix/views/home/data/datasource/imgs_data_source.c.dart';
import 'package:wallpix/views/home/data/models/img.model.dart';
import 'package:wallpix/views/home/domain/entities/img.entity.dart';
import 'package:http/http.dart' as http;

class ImgDataSourceImpl implements ImgDataSource {
  final http.Client httpClient;
  final ImgListUseCaseContract imgListUseCaseContract;

  ImgDataSourceImpl(
      {required this.httpClient, required this.imgListUseCaseContract});

  @override
  Future<List<ImgEntity>> getCuratedImg() async {
    return _getImgsFromDataSource(page: 1);
  }

  @override
  Future<List<ImgEntity>> getImgFromNextPage(
      {required int currentPage, String? query}) async {
    return _getImgsFromDataSource(
      page: currentPage + 1,
      query: query,
    );
  }

  @override
  Future<List<ImgEntity>> searchImg({required String query}) async {
    return _getImgsFromDataSource(
      page: 1,
      query: query,
    );
  }

  Future<List<ImgEntity>> _getImgsFromDataSource({
    required int page,
    String? query,
  }) async {
    final uri = Uri.parse(
      query == null
          ? 'https://api.unsplash.com/photos?page=$page&client_id=$kAccessKey&per_page=50'
          : 'https://api.unsplash.com/photos?page=1&client_id=$kAccessKey&per_page=50&query=$query',
    );
    final response = await httpClient.get(uri);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decodedResponse = jsonDecode(response.body);
      imgListUseCaseContract.totalPages = decodedResponse['total_pages'];
      final List<dynamic> results = decodedResponse['results'];
      for (int i = 0; i < results.length; i++) {
        imgListUseCaseContract.imgs.add(ImgModel.fromJson(results[i]));
      }
      return imgListUseCaseContract.imgs;
    } else {
      throw ServerFailure();
    }
  }
}
