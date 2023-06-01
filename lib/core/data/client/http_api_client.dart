import 'dart:convert';
import 'dart:io';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../error/exceptions.dart';

@singleton
class HttpApiClient {
  HttpApiClient({required Dio dioClient}) : _dioClient = dioClient {
    _initClient();
  }

  final Dio _dioClient;

  /// Handy method to make HTTP 'GET' request.
  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, String> headers = const <String, String>{},
    ResponseType responseType = ResponseType.json,
  }) {
    return _dioClient
        .get<T>(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers, responseType: responseType),
    )
        .onError((DioError error, _) => throw _catchErrors(error));
  }

  /// Handy method to make HTTP 'POST' request.
  Future<Response<T>> post<T>({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String> headers = const <String, String>{},
  }) {
    return _dioClient
        .post<T>(
      path,
      data: jsonDecode(jsonEncode(data)),
      queryParameters: queryParameters,
      options: Options(headers: headers, contentType: 'application/json'),
    )
        .onError((DioError error, _) => throw _catchErrors(error));
  }

  void _initClient(){
    _dioClient.options.headers = <String, String>{'Accept': 'application/json'};
    _dioClient.interceptors
      ..clear()
      ..add(CurlLoggerDioInterceptor(printOnSuccess: true))
      ..add(InterceptorsWrapper(
        onRequest: (options, handler) {
          final Map<String, dynamic> headers = <String, String>{};
          options.headers.addAll(headers);
          handler.next(options);
        } ,
      ))
    ;
  }

  Future<Response<T>> _catchErrors<T>(DioError dioError) {
    if (dioError.error is SocketException) {
      throw const OfflineException();
    }

    //TODO handle logger
    /*_logger.error(
      // ignore: lines_longer_than_80_chars
      '${dioError.requestOptions.method.toUpperCase()} -> ${dioError.requestOptions.path}: ${dioError.response?.statusCode ?? 500}',
      dioError.response?.data,
    );*/

    throw ApiException(
      method: dioError.requestOptions.method,
      path: dioError.requestOptions.path,
      data: dioError.requestOptions.data,
      statusCode: dioError.response?.statusCode ?? 500,
      error: dioError.response?.data,
    );
  }

}