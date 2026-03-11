import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_data.dart';

abstract class CategoriesRepository {
  Future<ApiResult<List<CategoryData>>> getAllCategories();
}
