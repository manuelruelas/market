import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../errors/exceptions.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({String? baseUrl})
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl ?? '',
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 3000),
        )) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Content-Type'] = 'application/json';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        log(error.toString());
        return handler.next(error);
      },
    ));
  }

  void updateBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (error) {
      throw _handleDioError(error);
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (error) {
      throw _handleDioError(error);
    }
  }

  // Puedes agregar más métodos como PUT, DELETE, etc.

  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioException.connectionTimeout:
      case DioException.sendTimeout:
      case DioException.receiveTimeout:
        return ServerException(message: 'Connection Timeout Exception');
      case DioException.badResponse:
        return ServerException(
            message: error.response?.data['message'] ?? 'Server Error');
      case DioException.requestCancelled:
        return ServerException(message: 'Request was cancelled');
      default:
        return ServerException(message: error.message ?? '');
    }
  }
}
