import 'package:collection/collection.dart';

abstract class BaseException implements Exception {
  const BaseException({this.message});

  final String? message;

  @override
  String toString() {
    return message == null
        ? runtimeType.toString()
        : '${runtimeType.toString()}: $message';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BaseException &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(message),
      );
}

class ApiException extends BaseException {
  ApiException({
    required this.method,
    required this.path,
    this.data,
    this.statusCode = 500,
    this.error,
  }) : super(
          message: '''
Error while calling ${method.toUpperCase()} -> '$path': response status: $statusCode''',
        );

  final String method;
  final String path;
  final dynamic data;
  final int statusCode;
  final dynamic error;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiException &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.method, method) &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(message),
        const DeepCollectionEquality().hash(method),
        const DeepCollectionEquality().hash(path),
        const DeepCollectionEquality().hash(data),
        const DeepCollectionEquality().hash(statusCode),
        const DeepCollectionEquality().hash(error),
      );
}

class LocalDataSourceException extends BaseException {
  const LocalDataSourceException({String? message}) : super(message: message);
}

class OfflineException extends BaseException {
  const OfflineException({String? message}) : super(message: message);
}

class RemoteDataSourceException extends BaseException {
  const RemoteDataSourceException({String? message}) : super(message: message);
}
