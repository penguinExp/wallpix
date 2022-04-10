import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wallpix/core/errors/custom_failure.c.dart';

abstract class ImgUsecase<Type, Parameters> {
  Future<Either<CustomFailure, Type>> call(Parameters parameters);
}

class CuratedImgParameters extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchImgParameters extends Equatable {
  final String query;

  const SearchImgParameters({required this.query});
  @override
  List<Object?> get props => [query];
}

class GetMoreImgParameters extends Equatable {
  final int currentPage;

  const GetMoreImgParameters({required this.currentPage});
  @override
  List<Object?> get props => [];
}
