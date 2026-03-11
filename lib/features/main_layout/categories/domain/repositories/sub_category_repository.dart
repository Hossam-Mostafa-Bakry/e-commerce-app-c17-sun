import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/sub_category_data.dart';

abstract class SubCategoryRepository {
  Future<ApiResult<List<SubCategoryData>>> getAllSubCategories(String id);
}
