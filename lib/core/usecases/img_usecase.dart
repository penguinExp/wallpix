import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wallpix/core/core.dart';

abstract class ImgUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class CuratedParms extends Equatable {
  final int page;

  const CuratedParms({required this.page});
  @override
  List<Object?> get props => [page];
}

class SearchParams extends Equatable {
  final String query;
  final int page;

  const SearchParams({required this.query, required this.page});

  @override
  List<Object?> get props => [query, page];
}
