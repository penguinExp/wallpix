import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.images.dart';


// Img Repo Contract
// Dependency inversion
abstract class ImgRepository {
  Future<Either<Failure, List<ImgEntity>>> searchImgs(String query);
  Future<Either<Failure, List<ImgEntity>>> getCuratedImgs();
}
