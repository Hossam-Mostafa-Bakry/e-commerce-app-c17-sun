import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/manager/sub_category_bloc.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_data.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/manager/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.containerGray,
          border: Border(
              // set the border for only 3 sides
              top: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3)),
              left: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3)),
              bottom: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3))),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12),
            bottomLeft: Radius.circular(AppSize.s12),
          ),
        ),

        // the categories items list
        child: ClipRRect(
          // clip the corners of the container that hold the list view
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12),
            bottomLeft: Radius.circular(AppSize.s12),
          ),
          child: BlocConsumer<CategoryBloc, CategoryState>(
            listener: (context, state) {
              if (state is GetCategoriesSuccess) {
                context.read<SubCategoryBloc>().add(GetAllSubCategoriesEvent(
                    state.categories[selectedIndex].id));
              }
            },
            builder: (context, state) {
              switch (state) {
                case CategoryInitial():
                  return const CircularProgressIndicator();
                case GetCategoriesLoading():
                  return const CircularProgressIndicator();
                case GetCategoriesSuccess():
                  return ListView.builder(
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) => CategoryItem(
                      index,
                      state.categories[index],
                      selectedIndex == index,
                      onItemClick,
                    ),
                  );
                case GetCategoriesFailure():
                  return Text(state.error);
              }
            },
          ),
        ),
      ),
    );
  }

  // callback function to change the selected index
  onItemClick(int index, CategoryData data) {
    setState(() {
      selectedIndex = index;
      context.read<SubCategoryBloc>().add(GetAllSubCategoriesEvent(data.id));
    });
  }
}
