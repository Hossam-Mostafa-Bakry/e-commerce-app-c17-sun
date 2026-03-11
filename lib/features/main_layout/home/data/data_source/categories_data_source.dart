import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network_handler/api_interface.dart';
import 'package:ecommerce_app/core/network_handler/end_points.dart';

abstract class CategoriesDataSource {
  Future<Response> getAllCategories();
}

class RemoteCategoriesDataSource implements CategoriesDataSource {
  final ApiInterface _apiInterface;

  RemoteCategoriesDataSource(this._apiInterface);

  @override
  Future<Response<dynamic>> getAllCategories() async {
    return await _apiInterface.get(EndPoints.categories);
  }
}
