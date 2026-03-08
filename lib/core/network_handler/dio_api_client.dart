import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network_handler/api_constants.dart';
import 'package:ecommerce_app/core/network_handler/api_interface.dart';

import 'api_logs_interceptors.dart';

class DioApiClient implements ApiInterface {
  DioApiClient() {
    _initInterceptors();
  }

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
    ),
  );

  _initInterceptors() {
    _dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // Do something before request is sent.
          // If you want to resolve the request with custom data,
          // you can resolve a `Response` using `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject with a `DioException` using `handler.reject(dioError)`.
          options.headers["Content-Type"] = "application/json";

          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // Do something with response data.
          // If you want to reject the request with a error message,
          // you can reject a `DioException` object using `handler.reject(dioError)`.
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          // Do something with response error.
          // If you want to resolve the request with some custom data,
          // you can resolve a `Response` object using `handler.resolve(response)`.
          return handler.next(error);
        },
      ),
      ApiLogsInterceptors(),
    ]);

    log("Dio Initialized successfully");
  }

  @override
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    return await _dio.get(endpoint, queryParameters: queryParams);
  }

  @override
  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  }) async {
    return await _dio.post(
      endpoint,
      data: body,
      queryParameters: queryParams,
    );
  }

  @override
  Future<Response> postFormData(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    FormData? body,
  }) async {
    return await _dio.post(
      endpoint,
      data: body,
      queryParameters: queryParams,
    );
  }

  @override
  Future<Response> put(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  }) async {
    return await _dio.put(
      endpoint,
      data: body,
      queryParameters: queryParams,
    );
  }

  @override
  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    return await _dio.delete(
      endpoint,
      queryParameters: queryParams,
    );
  }
}
