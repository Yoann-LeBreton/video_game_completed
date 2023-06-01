// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoGameState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SearchVideogameResponse data) success,
    required TResult Function(Exception exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SearchVideogameResponse data)? success,
    TResult? Function(Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchVideogameResponse data)? success,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoGameStateInitial value) initial,
    required TResult Function(VideoGameStateLoading value) loading,
    required TResult Function(VideoGameStateSuccess value) success,
    required TResult Function(VideoGameStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoGameStateInitial value)? initial,
    TResult? Function(VideoGameStateLoading value)? loading,
    TResult? Function(VideoGameStateSuccess value)? success,
    TResult? Function(VideoGameStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoGameStateInitial value)? initial,
    TResult Function(VideoGameStateLoading value)? loading,
    TResult Function(VideoGameStateSuccess value)? success,
    TResult Function(VideoGameStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoGameStateCopyWith<$Res> {
  factory $VideoGameStateCopyWith(
          VideoGameState value, $Res Function(VideoGameState) then) =
      _$VideoGameStateCopyWithImpl<$Res, VideoGameState>;
}

/// @nodoc
class _$VideoGameStateCopyWithImpl<$Res, $Val extends VideoGameState>
    implements $VideoGameStateCopyWith<$Res> {
  _$VideoGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$VideoGameStateInitialCopyWith<$Res> {
  factory _$$VideoGameStateInitialCopyWith(_$VideoGameStateInitial value,
          $Res Function(_$VideoGameStateInitial) then) =
      __$$VideoGameStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VideoGameStateInitialCopyWithImpl<$Res>
    extends _$VideoGameStateCopyWithImpl<$Res, _$VideoGameStateInitial>
    implements _$$VideoGameStateInitialCopyWith<$Res> {
  __$$VideoGameStateInitialCopyWithImpl(_$VideoGameStateInitial _value,
      $Res Function(_$VideoGameStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VideoGameStateInitial implements VideoGameStateInitial {
  const _$VideoGameStateInitial();

  @override
  String toString() {
    return 'VideoGameState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VideoGameStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SearchVideogameResponse data) success,
    required TResult Function(Exception exception) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SearchVideogameResponse data)? success,
    TResult? Function(Exception exception)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchVideogameResponse data)? success,
    TResult Function(Exception exception)? error,
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
    required TResult Function(VideoGameStateInitial value) initial,
    required TResult Function(VideoGameStateLoading value) loading,
    required TResult Function(VideoGameStateSuccess value) success,
    required TResult Function(VideoGameStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoGameStateInitial value)? initial,
    TResult? Function(VideoGameStateLoading value)? loading,
    TResult? Function(VideoGameStateSuccess value)? success,
    TResult? Function(VideoGameStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoGameStateInitial value)? initial,
    TResult Function(VideoGameStateLoading value)? loading,
    TResult Function(VideoGameStateSuccess value)? success,
    TResult Function(VideoGameStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class VideoGameStateInitial implements VideoGameState {
  const factory VideoGameStateInitial() = _$VideoGameStateInitial;
}

/// @nodoc
abstract class _$$VideoGameStateLoadingCopyWith<$Res> {
  factory _$$VideoGameStateLoadingCopyWith(_$VideoGameStateLoading value,
          $Res Function(_$VideoGameStateLoading) then) =
      __$$VideoGameStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VideoGameStateLoadingCopyWithImpl<$Res>
    extends _$VideoGameStateCopyWithImpl<$Res, _$VideoGameStateLoading>
    implements _$$VideoGameStateLoadingCopyWith<$Res> {
  __$$VideoGameStateLoadingCopyWithImpl(_$VideoGameStateLoading _value,
      $Res Function(_$VideoGameStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VideoGameStateLoading implements VideoGameStateLoading {
  const _$VideoGameStateLoading();

  @override
  String toString() {
    return 'VideoGameState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VideoGameStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SearchVideogameResponse data) success,
    required TResult Function(Exception exception) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SearchVideogameResponse data)? success,
    TResult? Function(Exception exception)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchVideogameResponse data)? success,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoGameStateInitial value) initial,
    required TResult Function(VideoGameStateLoading value) loading,
    required TResult Function(VideoGameStateSuccess value) success,
    required TResult Function(VideoGameStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoGameStateInitial value)? initial,
    TResult? Function(VideoGameStateLoading value)? loading,
    TResult? Function(VideoGameStateSuccess value)? success,
    TResult? Function(VideoGameStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoGameStateInitial value)? initial,
    TResult Function(VideoGameStateLoading value)? loading,
    TResult Function(VideoGameStateSuccess value)? success,
    TResult Function(VideoGameStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class VideoGameStateLoading implements VideoGameState {
  const factory VideoGameStateLoading() = _$VideoGameStateLoading;
}

/// @nodoc
abstract class _$$VideoGameStateSuccessCopyWith<$Res> {
  factory _$$VideoGameStateSuccessCopyWith(_$VideoGameStateSuccess value,
          $Res Function(_$VideoGameStateSuccess) then) =
      __$$VideoGameStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchVideogameResponse data});
}

/// @nodoc
class __$$VideoGameStateSuccessCopyWithImpl<$Res>
    extends _$VideoGameStateCopyWithImpl<$Res, _$VideoGameStateSuccess>
    implements _$$VideoGameStateSuccessCopyWith<$Res> {
  __$$VideoGameStateSuccessCopyWithImpl(_$VideoGameStateSuccess _value,
      $Res Function(_$VideoGameStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$VideoGameStateSuccess(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SearchVideogameResponse,
    ));
  }
}

/// @nodoc

class _$VideoGameStateSuccess implements VideoGameStateSuccess {
  const _$VideoGameStateSuccess(this.data);

  @override
  final SearchVideogameResponse data;

  @override
  String toString() {
    return 'VideoGameState.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoGameStateSuccess &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoGameStateSuccessCopyWith<_$VideoGameStateSuccess> get copyWith =>
      __$$VideoGameStateSuccessCopyWithImpl<_$VideoGameStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SearchVideogameResponse data) success,
    required TResult Function(Exception exception) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SearchVideogameResponse data)? success,
    TResult? Function(Exception exception)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchVideogameResponse data)? success,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoGameStateInitial value) initial,
    required TResult Function(VideoGameStateLoading value) loading,
    required TResult Function(VideoGameStateSuccess value) success,
    required TResult Function(VideoGameStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoGameStateInitial value)? initial,
    TResult? Function(VideoGameStateLoading value)? loading,
    TResult? Function(VideoGameStateSuccess value)? success,
    TResult? Function(VideoGameStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoGameStateInitial value)? initial,
    TResult Function(VideoGameStateLoading value)? loading,
    TResult Function(VideoGameStateSuccess value)? success,
    TResult Function(VideoGameStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class VideoGameStateSuccess implements VideoGameState {
  const factory VideoGameStateSuccess(final SearchVideogameResponse data) =
      _$VideoGameStateSuccess;

  SearchVideogameResponse get data;
  @JsonKey(ignore: true)
  _$$VideoGameStateSuccessCopyWith<_$VideoGameStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VideoGameStateErrorCopyWith<$Res> {
  factory _$$VideoGameStateErrorCopyWith(_$VideoGameStateError value,
          $Res Function(_$VideoGameStateError) then) =
      __$$VideoGameStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception exception});
}

/// @nodoc
class __$$VideoGameStateErrorCopyWithImpl<$Res>
    extends _$VideoGameStateCopyWithImpl<$Res, _$VideoGameStateError>
    implements _$$VideoGameStateErrorCopyWith<$Res> {
  __$$VideoGameStateErrorCopyWithImpl(
      _$VideoGameStateError _value, $Res Function(_$VideoGameStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$VideoGameStateError(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$VideoGameStateError implements VideoGameStateError {
  const _$VideoGameStateError(this.exception);

  @override
  final Exception exception;

  @override
  String toString() {
    return 'VideoGameState.error(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoGameStateError &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoGameStateErrorCopyWith<_$VideoGameStateError> get copyWith =>
      __$$VideoGameStateErrorCopyWithImpl<_$VideoGameStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SearchVideogameResponse data) success,
    required TResult Function(Exception exception) error,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SearchVideogameResponse data)? success,
    TResult? Function(Exception exception)? error,
  }) {
    return error?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SearchVideogameResponse data)? success,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoGameStateInitial value) initial,
    required TResult Function(VideoGameStateLoading value) loading,
    required TResult Function(VideoGameStateSuccess value) success,
    required TResult Function(VideoGameStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VideoGameStateInitial value)? initial,
    TResult? Function(VideoGameStateLoading value)? loading,
    TResult? Function(VideoGameStateSuccess value)? success,
    TResult? Function(VideoGameStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoGameStateInitial value)? initial,
    TResult Function(VideoGameStateLoading value)? loading,
    TResult Function(VideoGameStateSuccess value)? success,
    TResult Function(VideoGameStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class VideoGameStateError implements VideoGameState {
  const factory VideoGameStateError(final Exception exception) =
      _$VideoGameStateError;

  Exception get exception;
  @JsonKey(ignore: true)
  _$$VideoGameStateErrorCopyWith<_$VideoGameStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
