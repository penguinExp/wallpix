import 'package:dartz/dartz.dart';
import 'package:wallpix/core/core.dart';
import 'package:wallpix/modules/images/domain/domain.images.dart';

class SearchImgs implements ImgUseCase<List<ImgEntity>, Params> {
  final ImgRepository repository;

  SearchImgs(this.repository);

  @override
  Future<Either<Failure, List<ImgEntity>>> call(Params params) async {
    return await repository.searchImgs(params.query);
  }
}
