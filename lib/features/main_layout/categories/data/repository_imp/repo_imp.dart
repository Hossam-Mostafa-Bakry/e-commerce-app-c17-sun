import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_source/sub_category_data_soure.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/sub_category_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/sub_category_data.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/sub_category_repository.dart';

class RepoImp implements SubCategoryRepository {
  final SubCategoryDataSource _subCategoryDataSource;

  RepoImp(this._subCategoryDataSource);

  @override
  Future<ApiResult<List<SubCategoryData>>> getAllSubCategories(String id) async {
    try {
      final response = await _subCategoryDataSource.getAllSubCategory(id);

      if (response.statusCode == 200) {
        List<SubCategoryData> dataList = [];

        /// parsing
        for (var element in response.data["data"]) {
          var data = SubCategoryModel.fromJson(element);
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