import 'dart:convert';

class CategoryModel {
  final String id;
  final String name;
  final String image;

  CategoryModel({required this.id, required this.name, required this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      image: map['image'] != null ? map['image'] as String : '', // Provide a default value

    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'image': image,
    };
  }
}
