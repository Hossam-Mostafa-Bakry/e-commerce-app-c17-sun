import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/network_handler/api_result.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_source/categories_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/repository_imp/categories_repositories_imp.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_data.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/categories_repository.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_all_categories_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<GetAllCategoriesEvent>(_onAddGetAllCategoryEvent);
  }

  /// Use Case
  /// Repository
  /// Data Source

  late GetAllCategoriesUseCase _categoriesUseCase;
  late CategoriesRepository _categoriesRepository;
  late CategoriesDataSource _categoriesDataSource;

  FutureOr<void> _onAddGetAllCategoryEvent(
    GetAllCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    _categoriesDataSource = RemoteCategoriesDataSource(GetIt.I());
    _categoriesRepository = CategoriesRepositoriesImp(_categoriesDataSource);
    _categoriesUseCase = GetAllCategoriesUseCase(_categoriesRepository);

    emit(GetCategoriesLoading());
    final result = await _categoriesUseCase.execute();

    switch (result) {
      case SuccessRequest():
        emit(GetCategoriesSuccess(result.data));
      case FailureRequest():
        emit(GetCategoriesFailure(result.exception.message ?? ""));
    }
  }
}
