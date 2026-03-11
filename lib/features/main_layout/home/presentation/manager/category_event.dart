part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class GetAllCategoriesEvent extends CategoryEvent {
  @override
  List<Object?> get props => [];
}
