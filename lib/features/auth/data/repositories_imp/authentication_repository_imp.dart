import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/failures/server_failure.dart';
import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/auth/data/data_source/authentication_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_in_request_data.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request_data.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/authentication_repositories.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  /// Data Source

  final AuthenticationInterfaceDataSource _authenticationInterfaceDataSource;

  AuthenticationRepositoryImp(this._authenticationInterfaceDataSource);

  @override
  Future<ApiResult<bool>> signInWithCredentials(
      {required SignInRequestData data}) async {
    // logic return for data
    // success || Error
    try {
      final response = await _authenticationInterfaceDataSource
          .signInWithCredentials(data: data);

      if (response.statusCode == 200) {
        /// store my token
        return ApiResult.success(data: true);
      } else {
        return ApiResult.failure(
          exception: ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"],
          ),
        );
      }
    } on DioException catch (dioException) {
      return ApiResult.failure(
        exception: ServerFailure(
          statusCode: dioException.response?.statusCode.toString() ?? "",
          message: dioException.response?.data["message"],
        ),
      );
    }
  }

  @override
  Future<void> signUpWithCredentials({required SignUpRequestData data}) async {
    try {
      _authenticationInterfaceDataSource.signUpWithCredentials(data: data);
    } catch (e) {}
  }

  @override
  Future<void> forgetPassword({required String email}) async {
    try {
      _authenticationInterfaceDataSource.forgetPassword(email: email);
    } catch (e) {}
  }
}
