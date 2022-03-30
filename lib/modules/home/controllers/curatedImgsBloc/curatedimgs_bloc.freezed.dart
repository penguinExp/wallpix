// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'curatedimgs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CuratedimgsEventTearOff {
  const _$CuratedimgsEventTearOff();

  LoadCuratedImgsList loadCuratedImgsList() {
    return const LoadCuratedImgsList();
  }
}

/// @nodoc
const $CuratedimgsEvent = _$CuratedimgsEventTearOff();

/// @nodoc
mixin _$CuratedimgsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCuratedImgsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCuratedImgsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCuratedImgsList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCuratedImgsList value) loadCuratedImgsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCuratedImgsList value)? loadCuratedImgsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCuratedImgsList value)? loadCuratedImgsList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CuratedimgsEventCopyWith<$Res> {
  factory $CuratedimgsEventCopyWith(
          CuratedimgsEvent value, $Res Function(CuratedimgsEvent) then) =
      _$CuratedimgsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CuratedimgsEventCopyWithImpl<$Res>
    implements $CuratedimgsEventCopyWith<$Res> {
  _$CuratedimgsEventCopyWithImpl(this._value, this._then);

  final CuratedimgsEvent _value;
  // ignore: unused_field
  final $Res Function(CuratedimgsEvent) _then;
}

/// @nodoc
abstract class $LoadCuratedImgsListCopyWith<$Res> {
  factory $LoadCuratedImgsListCopyWith(
          LoadCuratedImgsList value, $Res Function(LoadCuratedImgsList) then) =
      _$LoadCuratedImgsListCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadCuratedImgsListCopyWithImpl<$Res>
    extends _$CuratedimgsEventCopyWithImpl<$Res>
    implements $LoadCuratedImgsListCopyWith<$Res> {
  _$LoadCuratedImgsListCopyWithImpl(
      LoadCuratedImgsList _value, $Res Function(LoadCuratedImgsList) _then)
      : super(_value, (v) => _then(v as LoadCuratedImgsList));

  @override
  LoadCuratedImgsList get _value => super._value as LoadCuratedImgsList;
}

/// @nodoc

class _$LoadCuratedImgsList
    with DiagnosticableTreeMixin
    implements LoadCuratedImgsList {
  const _$LoadCuratedImgsList();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CuratedimgsEvent.loadCuratedImgsList()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'CuratedimgsEvent.loadCuratedImgsList'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadCuratedImgsList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCuratedImgsList,
  }) {
    return loadCuratedImgsList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCuratedImgsList,
  }) {
    return loadCuratedImgsList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCuratedImgsList,
    required TResult orElse(),
  }) {
    if (loadCuratedImgsList != null) {
      return loadCuratedImgsList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCuratedImgsList value) loadCuratedImgsList,
  }) {
    return loadCuratedImgsList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCuratedImgsList value)? loadCuratedImgsList,
  }) {
    return loadCuratedImgsList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCuratedImgsList value)? loadCuratedImgsList,
    required TResult orElse(),
  }) {
    if (loadCuratedImgsList != null) {
      return loadCuratedImgsList(this);
    }
    return orElse();
  }
}

abstract class LoadCuratedImgsList implements CuratedimgsEvent {
  const factory LoadCuratedImgsList() = _$LoadCuratedImgsList;
}

/// @nodoc
class _$CuratedimgsStateTearOff {
  const _$CuratedimgsStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  LoadSuccess loadSuccess({required List<ImgModel> curatedImgs}) {
    return LoadSuccess(
      curatedImgs: curatedImgs,
    );
  }

  LoadFailure loadFailure({required ErrorObject errorObject}) {
    return LoadFailure(
      errorObject: errorObject,
    );
  }
}

/// @nodoc
const $CuratedimgsState = _$CuratedimgsStateTearOff();

/// @nodoc
mixin _$CuratedimgsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ImgModel> curatedImgs) loadSuccess,
    required TResult Function(ErrorObject errorObject) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ImgModel> curatedImgs)? loadSuccess,
    TResult Function(ErrorObject errorObject)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ImgModel> curatedImgs)? loadSuccess,
    TResult Function(ErrorObject errorObject)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CuratedimgsStateCopyWith<$Res> {
  factory $CuratedimgsStateCopyWith(
          CuratedimgsState value, $Res Function(CuratedimgsState) then) =
      _$CuratedimgsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CuratedimgsStateCopyWithImpl<$Res>
    implements $CuratedimgsStateCopyWith<$Res> {
  _$CuratedimgsStateCopyWithImpl(this._value, this._then);

  final CuratedimgsState _value;
  // ignore: unused_field
  final $Res Function(CuratedimgsState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$CuratedimgsStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CuratedimgsState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CuratedimgsState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ImgModel> curatedImgs) loadSuccess,
    required TResult Function(ErrorObject errorObject) loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ImgModel> curatedImgs)? loadSuccess,
    TResult Function(ErrorObject errorObject)? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ImgModel> curatedImgs)? loadSuccess,
    TResult Function(ErrorObject errorObject)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CuratedimgsState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class $LoadSuccessCopyWith<$Res> {
  factory $LoadSuccessCopyWith(
          LoadSuccess value, $Res Function(LoadSuccess) then) =
      _$LoadSuccessCopyWithImpl<$Res>;
  $Res call({List<ImgModel> curatedImgs});
}

/// @nodoc
class _$LoadSuccessCopyWithImpl<$Res>
    extends _$CuratedimgsStateCopyWithImpl<$Res>
    implements $LoadSuccessCopyWith<$Res> {
  _$LoadSuccessCopyWithImpl(
      LoadSuccess _value, $Res Function(LoadSuccess) _then)
      : super(_value, (v) => _then(v as LoadSuccess));

  @override
  LoadSuccess get _value => super._value as LoadSuccess;

  @override
  $Res call({
    Object? curatedImgs = freezed,
  }) {
    return _then(LoadSuccess(
      curatedImgs: curatedImgs == freezed
          ? _value.curatedImgs
          : curatedImgs // ignore: cast_nullable_to_non_nullable
              as List<ImgModel>,
    ));
  }
}

/// @nodoc

class _$LoadSuccess with DiagnosticableTreeMixin implements LoadSuccess {
  const _$LoadSuccess({required this.curatedImgs});

  @override
  final List<ImgModel> curatedImgs;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CuratedimgsState.loadSuccess(curatedImgs: $curatedImgs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CuratedimgsState.loadSuccess'))
      ..add(DiagnosticsProperty('curatedImgs', curatedImgs));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadSuccess &&
            const DeepCollectionEquality()
                .equals(other.curatedImgs, curatedImgs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(curatedImgs));

  @JsonKey(ignore: true)
  @override
  $LoadSuccessCopyWith<LoadSuccess> get copyWith =>
      _$LoadSuccessCopyWithImpl<LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ImgModel> curatedImgs) loadSuccess,
    required TResult Function(ErrorObject errorObject) loadFailure,
  }) {
    return loadSuccess(curatedImgs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ImgModel> curatedImgs)? loadSuccess,
    TResult Function(ErrorObject errorObject)? loadFailure,
  }) {
    return loadSuccess?.call(curatedImgs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ImgModel> curatedImgs)? loadSuccess,
    TResult Function(ErrorObject errorObject)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(curatedImgs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class LoadSuccess implements CuratedimgsState {
  const factory LoadSuccess({required List<ImgModel> curatedImgs}) =
      _$LoadSuccess;

  List<ImgModel> get curatedImgs;
  @JsonKey(ignore: true)
  $LoadSuccessCopyWith<LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadFailureCopyWith<$Res> {
  factory $LoadFailureCopyWith(
          LoadFailure value, $Res Function(LoadFailure) then) =
      _$LoadFailureCopyWithImpl<$Res>;
  $Res call({ErrorObject errorObject});
}

/// @nodoc
class _$LoadFailureCopyWithImpl<$Res>
    extends _$CuratedimgsStateCopyWithImpl<$Res>
    implements $LoadFailureCopyWith<$Res> {
  _$LoadFailureCopyWithImpl(
      LoadFailure _value, $Res Function(LoadFailure) _then)
      : super(_value, (v) => _then(v as LoadFailure));

  @override
  LoadFailure get _value => super._value as LoadFailure;

  @override
  $Res call({
    Object? errorObject = freezed,
  }) {
    return _then(LoadFailure(
      errorObject: errorObject == freezed
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject,
    ));
  }
}

/// @nodoc

class _$LoadFailure with DiagnosticableTreeMixin implements LoadFailure {
  const _$LoadFailure({required this.errorObject});

  @override
  final ErrorObject errorObject;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CuratedimgsState.loadFailure(errorObject: $errorObject)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CuratedimgsState.loadFailure'))
      ..add(DiagnosticsProperty('errorObject', errorObject));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadFailure &&
            const DeepCollectionEquality()
                .equals(other.errorObject, errorObject));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorObject));

  @JsonKey(ignore: true)
  @override
  $LoadFailureCopyWith<LoadFailure> get copyWith =>
      _$LoadFailureCopyWithImpl<LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ImgModel> curatedImgs) loadSuccess,
    required TResult Function(ErrorObject errorObject) loadFailure,
  }) {
    return loadFailure(errorObject);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ImgModel> curatedImgs)? loadSuccess,
    TResult Function(ErrorObject errorObject)? loadFailure,
  }) {
    return loadFailure?.call(errorObject);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ImgModel> curatedImgs)? loadSuccess,
    TResult Function(ErrorObject errorObject)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(errorObject);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class LoadFailure implements CuratedimgsState {
  const factory LoadFailure({required ErrorObject errorObject}) = _$LoadFailure;

  ErrorObject get errorObject;
  @JsonKey(ignore: true)
  $LoadFailureCopyWith<LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
