// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SubCategoryModels {
  final String categoryId;
  final String categoryName;
  final String image;
  final String subcategoryName;
  final String subcategoryId;

  SubCategoryModels(
      {required this.categoryId,
      required this.categoryName,
      required this.image,
      required this.subcategoryName,
      required this.subcategoryId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'categoryName': categoryName,
      'image': image,
      'subcategoryName': subcategoryName,
      'subcategoryId': subcategoryId,
    };
  }

  factory SubCategoryModels.fromMap(Map<String, dynamic> map) {
    return SubCategoryModels(
      categoryId: map['categoryId'] as String,
      categoryName: map['categoryName'] as String,
      image: map['image'] != null
          ? map['image'] as String
          : '', // Provide a default value
      subcategoryName: map['subcategoryName'] as String,
      subcategoryId: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategoryModels.fromJson(String source) =>
      SubCategoryModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
