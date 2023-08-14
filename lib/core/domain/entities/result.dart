import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const Result._();

  const factory Result.success({required T data}) = ResultSuccess<T>;

  const factory Result.failure({required Exception exception}) =
      ResultFailure<T>;

  bool get isSuccess =>
      when(success: (T data) => true, failure: (Exception exception) => false);

  bool get isFailure => !isSuccess;

  /// Returns the encapsulated value if this instance represents a success
  /// ([Result.isSuccess]) or `null` if it is a failure ([Result.isFailure]).
  ///
  /// This function is a shorthand for `getOrElse { null }` (see [getOrElse]) or
  /// `when(onSuccess = { it }, onFailure = { null })` (see [when]).
  T? getOrNull() {
    return whenOrNull(success: (T data) => data);
  }

  /// Returns the encapsulated value if this instance represents a success
  /// ([Result.isSuccess]) or the result of [onFailure] function for the
  /// encapsulated [Exception] exception if it is a failure ([Result.isFailure]).
  ///
  /// Note that this function rethrows any [Exception] exception thrown by
  /// [onFailure] function.
  ///
  /// This function is a shorthand for `when(onSuccess = { it }, onFailure = onFailure)`
  /// (see [when]).
  T getOrElse(T Function(Exception exception) onFailure) {
    return when(
      success: (T data) => data,
      failure: (Exception exception) => onFailure(exception),
    );
  }

  /// Returns the encapsulated value if this instance represents a success
  /// ([Result.isSuccess]) or the [defaultValue] if it is a failure
  /// ([Result.isFailure]).
  ///
  /// This function is a shorthand for `getOrElse { defaultValue }`
  /// (see [getOrElse]).
  T getOrDefault(T defaultValue) {
    return maybeWhen(success: (T data) => data, orElse: () => defaultValue);
  }

  /// Returns the encapsulated value if this instance represents a success
  /// ([Result.isSuccess]) or throws the encapsulated [Exception] exception if
  /// it is a failure ([Result.isFailure]).
  ///
  /// This function is a shorthand for `getOrElse { throw it }`
  /// (see [getOrElse]).
  T getOrThrow() {
    return when(
      success: (T data) => data,
      failure: (Exception exception) => throw exception,
    );
  }

  /// Returns the encapsulated [Exception] exception if this instance represents
  /// a failure [Result.isFailure] or `null` if it is a success [Result.isSuccess].
  ///
  /// This function is a shorthand for `when(onSuccess = { null }, onFailure = { it })`
  /// (see [when]).
  Exception? exceptionOrNull() {
    return whenOrNull(
      failure: (Exception exception) => exception,
    );
  }

  /// Throws exception if the result is failure.
  void throwOnFailure() {
    when(
      success: (T data) {},
      failure: (Exception exception) => throw exception,
    );
  }

  /// Performs the given [action] on the encapsulated [Exception] exception if
  /// this instance represents a failure ([Result.isFailure]).
  ///
  /// Returns the original `Result` unchanged.
  Result<T> onFailure(Function(Exception exception) action) {
    maybeWhen(
      failure: (Exception exception) => action(exception),
      orElse: () {},
    );

    return this;
  }

  /// Performs the given [action] on the encapsulated value if this instance
  /// represents a success ([Result.isSuccess]).
  ///
  /// Returns the original `Result` unchanged.
  Result<T> onSuccess(Function(T value) action) {
    maybeWhen(
      success: (T data) => action(data),
      orElse: () {},
    );

    return this;
  }
}

extension ResultExt<T> on T {
  Result<T> asSuccess() => Result<T>.success(data: this);

  Result<T> asFailure(Exception exception) =>
      Result<T>.failure(exception: exception);
}

/// Calls the specified function [block] and returns its encapsulated result
/// if invocation was successful, catching and encapsulating any thrown
/// exception as a failure.
Result<R> runCatching<R>(R Function() block) {
  try {
    return Result<R>.success(data: block());
  } on Error catch (e) {
    return Result<R>.failure(exception: Exception(e.toString()));
  } on Exception catch (e) {
    return Result<R>.failure(exception: e);
  }
}

/// Calls the specified async function [block] and returns its encapsulated
/// result if invocation was successful, catching and encapsulating any thrown
/// exception as a failure.
Future<Result<R>> runCatchingAsync<R>(Future<R> Function() block) async {
  try {
    return Result<R>.success(data: await block());
  } on Error catch (e) {
    return Result<R>.failure(exception: Exception(e.toString()));
  } on Exception catch (e) {
    return Result<R>.failure(exception: e);
  }
}
