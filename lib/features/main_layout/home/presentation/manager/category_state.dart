part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
}

final class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

final class GetCategoriesLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

final class GetCategoriesSuccess extends CategoryState {
  final List<CategoryData> categories;

  const GetCategoriesSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}

final class GetCategoriesFailure extends CategoryState {
  final String error;

  const GetCategoriesFailure(this.error);

  @override
  List<Object> get props => [error];
}

