import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_source/sub_category_data_soure.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/repository_imp/repo_imp.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/sub_category_data.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/sub_category_repository.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/use_cases/get_all_sub_categories_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'sub_category_event.dart';

part 'sub_category_state.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, SubCategoryState> {
  SubCategoryBloc() : super(SubCategoryInitial()) {
    on<GetAllSubCategoriesEvent>(_onGetAllSubCategories);
  }

  late GetAllSubCategoriesUseCase _subCategoriesUseCase;
  late SubCategoryRepository _subCategoryRepository;
  late SubCategoryDataSource _subCategoryDataSource;

  Future<void> _onGetAllSubCategories(
    GetAllSubCategoriesEvent event,
    Emitter<SubCategoryState> emit,
  ) async {
    _subCategoryDataSource = RemoteSubCategoryDataSource(GetIt.I());
    _subCategoryRepository = RepoImp(_subCategoryDataSource);
    _subCategoriesUseCase = GetAllSubCategoriesUseCase(_subCategoryRepository);
    emit(GetSubCategoriesLoading());

    final result = await _subCategoriesUseCase.execute(event.categoryId);

    switch (result) {
      case SuccessRequest(data: final subCategories):
        emit(GetSubCategoriesSuccess(subCategories));
      case FailureRequest(exception: final exception):
        emit(GetSubCategoriesFailure(exception.message ?? ""));
    }
  }
}
