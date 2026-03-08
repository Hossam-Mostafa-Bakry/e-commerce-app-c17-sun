import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/failures/server_failure.dart';
import 'package:ecommerce_app/core/handler/auth_handler/auth_handler_shared_pref.dart';
import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/auth/data/data_source/authentication_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_in_request_data.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request_data.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/authentication_repositories.dart';
import 'package:get_it/get_it.dart';

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
        ///
        GetIt.I<AuthHandlerSharedPref>().saveToken(response.data["token"]);
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
  Future<ApiResult<bool>> signUpWithCredentials(
      {required SignUpRequestData data}) async {
    try {
      final response = await _authenticationInterfaceDataSource
          .signUpWithCredentials(data: data);

      if (response.statusCode == 201) {
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
  Future<void> forgetPassword({required String email}) async {
    try {
      _authenticationInterfaceDataSource.forgetPassword(email: email);
    } catch (e) {}
  }
}
