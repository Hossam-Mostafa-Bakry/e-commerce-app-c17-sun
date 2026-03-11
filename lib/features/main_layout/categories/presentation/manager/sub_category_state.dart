part of 'sub_category_bloc.dart';

sealed class SubCategoryState extends Equatable {
  const SubCategoryState();
}

final class SubCategoryInitial extends SubCategoryState {
  @override
  List<Object> get props => [];
}

final class GetSubCategoriesLoading extends SubCategoryState {
  @override
  List<Object?> get props => [];
}

final class GetSubCategoriesSuccess extends SubCategoryState {
  final List<SubCategoryData> subCategories;

  const GetSubCategoriesSuccess(this.subCategories);

  @override
  List<Object?> get props => [subCategories];
}

final class GetSubCategoriesFailure extends SubCategoryState {
  final String error;

  const GetSubCategoriesFailure(this.error);

  @override
  List<Object?> get props => [error];
}
