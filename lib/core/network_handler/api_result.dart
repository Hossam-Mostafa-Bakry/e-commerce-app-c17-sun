import 'package:ecommerce_app/core/failures/failures.dart';

sealed class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success({required T data}) {
    return SuccessRequest(data: data);
  }

  factory ApiResult.failure({required ServerFailure exception}) {
    return FailureRequest(exception: exception);
  }
}

class SuccessRequest<T> extends ApiResult<T> {
  final T data;

  const SuccessRequest({required this.data});
}

class FailureRequest extends ApiResult<Never> {
  final ServerFailure exception;

  FailureRequest({required this.exception});
}
