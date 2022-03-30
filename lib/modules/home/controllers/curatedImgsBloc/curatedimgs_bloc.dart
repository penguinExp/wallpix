import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallpix/core/core.dart';
import 'package:wallpix/modules/home/data/models/img.model.dart';
import 'package:wallpix/modules/home/domain/repositories/curated_img.repo.domain.dart';

part 'curatedimgs_event.dart';
part 'curatedimgs_state.dart';
part 'curatedimgs_bloc.freezed.dart';

class CuratedimgsBloc extends Bloc<CuratedimgsEvent, CuratedimgsState> {
  CuratedimgsBloc({required CuratedImgsRepository curatedImgsRepository})
      : super(const CuratedimgsState.initial()) {
    on<LoadCuratedImgsList>((event, emit) async {
      final Either<FailureEntity, List<ImgModel>> curatedImgEither =
          await curatedImgsRepository.getCuratedImgs();

      curatedImgEither.fold(
        (failure) => emit(
          CuratedimgsState.loadFailure(
            errorObject: ErrorObject.mapFailureToErrorObj(failure: failure),
          ),
        ),
        (curatedImgList) => emit(
          CuratedimgsState.loadSuccess(curatedImgs: curatedImgList),
        ),
      );
    });
  }
}
