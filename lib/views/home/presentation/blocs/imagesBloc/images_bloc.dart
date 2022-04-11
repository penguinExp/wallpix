import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/core.e.dart';
import '../../../domain/domain.e.dart';

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final GetCuratedImgUseCaseImpl getCuratedImgUseCase;
  final SearchImgUseCaseImpl searchImgUseCase;

  ImagesBloc({
    required this.getCuratedImgUseCase,
    required this.searchImgUseCase,
  }) : super(const ImagesState()) {
    
    on<ImagesFetched>((event, emit) async {
      
      late Either<CustomFailure, List<ImgEntity>> failureOrImgs;

      // Condition to check if the total images value is reached
      if (state.hasReachedEnd) return;

      // When images are being loaded for the first time
      if (state.status == ImagesBlocStatus.initial) {
        // Search Imgs query
        if (state.query.isNotEmpty) {
          failureOrImgs = await searchImgUseCase(
            SearchImgParameters(
              query: state.query,
              page: state.page,
            ),
          );
          // Curated Imgs query
        } else {
          failureOrImgs = await getCuratedImgUseCase(
              CuratedImgParameters(page: state.page));
        }
        failureOrImgs.fold(
          (failure) => emit(
            state.copyWith(
              status: ImagesBlocStatus.failure,
              errMsg: failure.errorMsg,
            ),
          ),
          (images) => emit(
            state.copyWith(
              status: ImagesBlocStatus.success,
              images: images,
              hasReachedEnd: false,
            ),
          ),
        );
      }
      // Query for loading more images
      // Search Imgs query
      if (state.query.isNotEmpty) {
        failureOrImgs = await searchImgUseCase(
          SearchImgParameters(
            query: state.query,
            page: state.page + 1,
          ),
        );
        // Curated Imgs query
      } else {
        failureOrImgs = await getCuratedImgUseCase(
            CuratedImgParameters(page: state.page + 1));
      }
      failureOrImgs.fold(
        (failure) => emit(
          state.copyWith(
            status: ImagesBlocStatus.failure,
            errMsg: failure.errorMsg,
          ),
        ),
        (images) {
          images.isEmpty
              ? state.copyWith(hasReachedEnd: true)
              : state.copyWith(
                  status: ImagesBlocStatus.success,
                  images: images,
                  hasReachedEnd: false,
                );
        },
        
      );

    },);
  }
}