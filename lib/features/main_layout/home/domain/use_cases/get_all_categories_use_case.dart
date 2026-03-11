import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_data.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/categories_repository.dart';

class GetAllCategoriesUseCase {
  final CategoriesRepository _categoriesRepository;

  GetAllCategoriesUseCase(this._categoriesRepository);

  Future<ApiResult<List<CategoryData>>> execute() async {
    return await _categoriesRepository.getAllCategories();
  }
}
