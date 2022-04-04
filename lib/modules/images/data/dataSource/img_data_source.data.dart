import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpix/core/core.dart';

import '../../../../core/errors/exception.core.dart';
import '../models/img.model.dart';

abstract class ImageDataSource {
  /// Calls the 'https://api.unsplash.com/search/photos?client_id=$kAccessKey&page=$page&query=$keyword' url
  /// 
  /// Throws a [serverException] for all the errors

  Future<List<ImgModel>> searchImgs(String query, int page);
  Future<List<ImgModel>> getCuratedImgs(int page);
}
class ImageDataSourceImpl implements ImageDataSource {
  final http.Client httpClient;

  ImageDataSourceImpl({required this.httpClient});

  @override
  Future<List<ImgModel>> getCuratedImgs(int page) async =>
      await getCuratedImgsFromAPI(page: page);

  @override
  Future<List<ImgModel>> searchImgs(String query, int page) async =>
      await searchImgsByKeyword(keyword: query, page: page);

  Future<List<ImgModel>> getCuratedImgsFromAPI({required int page}) async {
    final uri = Uri.parse(
        'https://api.unsplash.com/photos?page=$page&client_id=$kAccessKey');
    final response = await httpClient.get(uri);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final List<ImgModel> imgs = [];
      final List<dynamic> results = jsonDecode(response.body);
      for (int i = 0; i < results.length; i++) {
        imgs.add(ImgModel.fromJson(results[i]));
      }
      return imgs;
    } else {
      throw ServerException();
    }
  }

  Future<List<ImgModel>> searchImgsByKeyword(
      {required String keyword, required int page}) async {
    final uri = Uri.parse(
        'https://api.unsplash.com/search/photos?client_id=$kAccessKey&page=$page&query=$keyword');
    final response = await httpClient.get(uri);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final List<ImgModel> imgs = [];
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> results = jsonData["results"];
      for (int i = 0; i < results.length; i++) {
        imgs.add(
          ImgModel.fromJson(results[i]),
        );
      }
      return imgs;
    } else {
      throw ServerException();
    }
  }
}
