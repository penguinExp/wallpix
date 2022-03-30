import 'package:dartz/dartz.dart';
import 'package:wallpix/core/core.dart';
import 'package:wallpix/modules/images/domain/domain.images.dart';

class SearchImgs implements ImgUseCase<List<ImgEntity>, SearchParams> {
  final ImgRepository repository;

  SearchImgs(this.repository);

  @override
  Future<Either<Failure, List<ImgEntity>>> call(SearchParams params) async {
    return await repository.searchImgs(params.query, params.page);
  }
}
