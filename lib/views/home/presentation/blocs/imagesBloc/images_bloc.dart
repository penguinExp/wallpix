import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/core.e.dart';
import 'dart:developer';
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
    on<ImagesFetched>(
      (event, emit) async {
        late Either<CustomFailure, List<ImgEntity>> failureOrImgs;
        if (state.hasReachedEnd) return;

        // For getting initial curated images
        if (state.status == ImagesBlocStatus.initial) {
          log("Query is empty!");
          failureOrImgs = await getCuratedImgUseCase(
            CuratedImgParameters(page: event.page),
          );
          failureOrImgs.fold(
            (failure) => emit(
              state.copyWith(
                status: ImagesBlocStatus.failure,
                errorMsg: failure.errorMsg,
              ),
            ),
            (images) {
              emit(
                state.copyWith(
                  images: images,
                  status: ImagesBlocStatus.success,
                  hasReachedEnd: false,
                  isSearching: false,
                ),
              );
            },
          );
          // For getting more images either curated or for a searched query
        } else if (state.status == ImagesBlocStatus.success) {
          if (!state.isSearching && event.query.isNotEmpty) {
            emit(
              state.copyWith(
                status: ImagesBlocStatus.loading,
                isSearching: true,
              ),
            );
            failureOrImgs = await searchImgUseCase(
              SearchImgParameters(
                query: event.query,
                page: event.page,
              ),
            );
            failureOrImgs.fold(
              (failure) => emit(
                state.copyWith(
                  status: ImagesBlocStatus.failure,
                  errorMsg: failure.errorMsg,
                ),
              ),
              (images) => emit(
                state.copyWith(
                  images: images,
                  status: ImagesBlocStatus.success,
                  hasReachedEnd: false,
                ),
              ),
            );
          } else if (state.isSearching && event.query.trimRight().isEmpty) {
            emit(
              state.copyWith(
                status: ImagesBlocStatus.loading,
                isSearching: false,
              ),
            );
            failureOrImgs = await getCuratedImgUseCase(
              CuratedImgParameters(page: event.page),
            );
            failureOrImgs.fold(
              (failure) => emit(
                state.copyWith(
                  status: ImagesBlocStatus.failure,
                  errorMsg: failure.errorMsg,
                ),
              ),
              (images) => emit(
                state.copyWith(
                  images: images,
                  status: ImagesBlocStatus.success,
                  hasReachedEnd: false,
                  isSearching: false,
                ),
              ),
            );
          } else {
            emit(
              state.copyWith(
                status: ImagesBlocStatus.loading,
                isSearching: false,
              ),
            );
            if (event.query.isEmpty) {
              failureOrImgs = await getCuratedImgUseCase(
                CuratedImgParameters(page: event.page),
              );
            } else {
              failureOrImgs = await searchImgUseCase(
                SearchImgParameters(
                  query: event.query,
                  page: event.page,
                ),
              );
            }
            failureOrImgs.fold(
              (failure) => emit(
                state.copyWith(
                  status: ImagesBlocStatus.failure,
                  errorMsg: failure.errorMsg,
                ),
              ),
              (images) {
                if (images.isEmpty) {
                  log(
                    'Reached the end of list from API',
                    level: 1,
                    time: DateTime.now(),
                    sequenceNumber: 2,
                  );
                  emit(
                    state.copyWith(
                      images: List.of(state.images)..addAll(images),
                      status: ImagesBlocStatus.success,
                      hasReachedEnd: true,
                    ),
                  );
                } else {
                  emit(
                    state.copyWith(
                      images: List.of(state.images)..addAll(images),
                      status: ImagesBlocStatus.success,
                      hasReachedEnd: false,
                    ),
                  );
                }
              },
            );
          }
        }
      },
    );
  }
}
