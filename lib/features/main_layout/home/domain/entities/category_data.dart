import 'package:equatable/equatable.dart';

class CategoryData extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String image;

  const CategoryData({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  @override
  List<Object> get props => [id, name, slug, image];
}
