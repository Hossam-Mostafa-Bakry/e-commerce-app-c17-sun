import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network_handler/api_interface.dart';
import 'package:ecommerce_app/core/network_handler/dio_api_client.dart';
import 'package:ecommerce_app/core/network_handler/end_points.dart';
import 'package:ecommerce_app/features/auth/data/data_source/authentication_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_in_request_data.dart';
import 'package:ecommerce_app/features/auth/domain/entities/sign_up_request_data.dart';

class RemoteAuthenticationDataSource
    implements AuthenticationInterfaceDataSource {
  /// WebService || API || HTTP || Dio
  /// Fetch || Get || Post || Put || Delete from Network
  /// Dio

  final ApiInterface _apiInterface;

  RemoteAuthenticationDataSource(this._apiInterface);

  @override
  Future<Response> signInWithCredentials({
    required SignInRequestData data,
  }) async {
    return await _apiInterface.post(
      EndPoints.signIn,
      body: data.toJson(),
    );
  }

  @override
  Future<Response> signUpWithCredentials({
    required SignUpRequestData data,
  }) async {
    return await _apiInterface.post(
      EndPoints.signUp,
      body: data.toJson(),
    );
  }

  @override
  Future<Response> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }
}
