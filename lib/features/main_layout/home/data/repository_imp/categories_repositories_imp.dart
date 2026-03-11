import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_source/categories_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category_model.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_data.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/categories_repository.dart';

class CategoriesRepositoriesImp implements CategoriesRepository {
  final CategoriesDataSource _categoriesDataSource;

  CategoriesRepositoriesImp(this._categoriesDataSource);

  @override
  Future<ApiResult<List<CategoryData>>> getAllCategories() async {
    try {
      final response = await _categoriesDataSource.getAllCategories();

      if (response.statusCode == 200) {
        List<CategoryData> dataList = [];

        /// parsing
        for (var element in response.data["data"]) {
          var data = CategoryModel.fromJson(element);
          dataList.add(data);
        }
        return ApiResult.success(data: dataList);
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
}
