import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/manager/sub_category_bloc.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/manager/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoryBloc, SubCategoryState>(
      builder: (context, state) {
        switch (state) {
          case SubCategoryInitial():
            return const Expanded(
              flex: 2,
              child: Center(child: Text('Select a category')),
            );
          case GetSubCategoriesLoading():
            return const Expanded(
              flex: 2,
              child: Center(child: CircularProgressIndicator()),
            );
          case GetSubCategoriesSuccess():
            return Expanded(
              flex: 2,
              child: CustomScrollView(
                slivers: <Widget>[
                  // category title
                  SliverToBoxAdapter(
                    child: Text(
                      'Laptops & Electronics',
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: FontSize.s14),
                    ),
                  ),
                  // the category card
                  SliverToBoxAdapter(
                    child: CategoryCardItem(
                        "Laptops & Electronics",
                        ImageAssets.categoryCardImage,
                        goToCategoryProductsListScreen),
                  ),
                  // the grid view of the subcategories
                  SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.subCategories.length,
                        (context, index) => SubCategoryItem(
                            state.subCategories[index].name,
                            ImageAssets.subcategoryCardImage,
                            goToCategoryProductsListScreen),
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.75,
                        mainAxisSpacing: AppSize.s8,
                        crossAxisSpacing: AppSize.s8,
                      ))
                ],
              ),
            );
          case GetSubCategoriesFailure():
            return Expanded(
              flex: 2,
              child: Center(child: Text(state.error)),
            );
        }
      },
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
