import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/sub_category_data.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/sub_category_repository.dart';

class GetAllSubCategoriesUseCase {
  final SubCategoryRepository _repository;

  GetAllSubCategoriesUseCase(this._repository);

  Future<ApiResult<List<SubCategoryData>>> execute(String categoryId) {
    return _repository.getAllSubCategories(categoryId);
  }
}
