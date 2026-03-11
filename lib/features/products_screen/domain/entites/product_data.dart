class ProductData {
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final double price;
  final String imageCover;
  final List<String> images;
  final Category category;
  final SubCategory subcategory;
  final Brand brand;
  final double ratingsAverage;
  final int ratingsQuantity;
  final double sold;
  final List<Review> reviews;
  final String createdAt;
  final String updatedAt;

  const ProductData({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.images,
    required this.category,
    required this.subcategory,
    required this.brand,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.sold,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['_id'] ?? json['id'] ?? '',
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
      imageCover: json['imageCover'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      category: Category.fromJson(json['category'] ?? {}),
      subcategory: SubCategory.fromJson((json['subcategory'] as List?)?.first ?? {}),
      brand: Brand.fromJson(json['brand'] ?? {}),
      ratingsAverage: (json['ratingsAverage'] ?? 0).toDouble(),
      ratingsQuantity: json['ratingsQuantity'] ?? 0,
      sold: (json['sold'] ?? 0).toDouble(),
      reviews: (json['reviews'] as List?)?.map((e) => Review.fromJson(e)).toList() ?? [],
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}

class Category {
  final String id;
  final String name;
  final String slug;
  final String image;

  const Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

class SubCategory {
  final String id;
  final String name;
  final String slug;
  final String category;

  const SubCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      category: json['category'] ?? '',
    );
  }
}

class Brand {
  final String id;
  final String name;
  final String slug;
  final String image;

  const Brand({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

class Review {
  final String id;
  final String review;
  final double rating;
  final String product;
  final User user;
  final String createdAt;
  final String updatedAt;

  const Review({
    required this.id,
    required this.review,
    required this.rating,
    required this.product,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['_id'] ?? '',
      review: json['review'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      product: json['product'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}

class User {
  final String id;
  final String name;

  const User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}