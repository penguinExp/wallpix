import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.errors.freezed.dart';

@freezed
class FailureEntity with _$FailureEntity {
  const FailureEntity._();
  const factory FailureEntity.serverFailure() = ServerFailure;
  const factory FailureEntity.dataParsingFailure() = DataParsingFailure;
  const factory FailureEntity.noConnectionFailure() = NoConnectionFailure;
}