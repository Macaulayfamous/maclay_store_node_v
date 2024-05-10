import 'dart:convert';

class BannerModel {
  final String image;
  final String id;

  BannerModel({required this.image, required this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'id': id,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      image: map['image'] as String,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(Map<String, dynamic> map) {
    return BannerModel(
      image: map['image'] as String,
      id: map['_id'] as String,
    );
  }
}
