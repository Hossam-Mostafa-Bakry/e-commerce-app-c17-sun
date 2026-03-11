import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_data.dart';

class CategoryModel extends CategoryData {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      slug: json["slug"] ?? "",
      image: json["image"] ?? "",
    );
  }
}
