part of 'sub_category_bloc.dart';

sealed class SubCategoryEvent extends Equatable {
  const SubCategoryEvent();
}

class GetAllSubCategoriesEvent extends SubCategoryEvent {
  final String categoryId;

  const GetAllSubCategoriesEvent(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}
