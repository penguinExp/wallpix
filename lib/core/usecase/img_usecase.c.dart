import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wallpix/core/errors/custom_failure.c.dart';

abstract class ImgUsecase<Type, Parameters> {
  Future<Either<CustomFailure, Type>> call(Parameters parameters);
}

class CuratedImgParameters extends Equatable {
  final int page;

  const CuratedImgParameters({required this.page});
  @override
  List<Object?> get props => [page];
}

class SearchImgParameters extends Equatable {
  final String query;
  final int page;

  const SearchImgParameters({required this.query, required this.page});
  @override
  List<Object?> get props => [query, page];
}