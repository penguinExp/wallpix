import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpix/core/core.dart';
import 'package:wallpix/core/errors/custom_exceptions.errors.dart';

import '../models/img.model.dart';

class CuratedImgsAPI {
  CuratedImgsAPI({required this.httpClient});

  final http.Client httpClient;

  Future<List<ImgModel>> getCuratedImgs() async {
    try {
      final response = await httpClient.get(
          Uri.parse("https://api.pexels.com/v1/curated?per_page=80&page=1"),
          headers: {"Authorization": kAccessKey});

      if (response.statusCode == 200) {
        try {
          final List<ImgModel> curatedImgs = <ImgModel>[];
          Map<String, dynamic> jsonData = jsonDecode(response.body);
          List<dynamic> imgBody = jsonData['photos'];
          for (int i = 0; i < imgBody.length; i++) {
            curatedImgs.add(ImgModel.fromJson(imgBody[i]));
          }
          return curatedImgs;
        } on Exception {
          throw DataParsingException();
        }
      } else {
        throw ServerException();
      }
    } catch (e) {
      if ((e is ServerException) || (e is DataParsingException)) {
        rethrow;
      } else {
        throw NoConnectionException();
      }
    }
  }
}
