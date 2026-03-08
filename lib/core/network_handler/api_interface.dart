import 'package:dio/dio.dart';

abstract interface class ApiInterface {
  /// fetching data from network
  /// [HTTP]
  /// [Dio]

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  });

  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  });

  Future<dynamic> postFormData(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    FormData? body,
  });

  Future<dynamic> put(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  });

  Future<dynamic> delete(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  });
}
