import 'package:ecommerce_app/features/main_layout/categories/domain/entities/sub_category_data.dart';

class SubCategoryModel extends SubCategoryData {
  SubCategoryModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.category,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      category: json['category'] ?? '',
    );
  }
}
