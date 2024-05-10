// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final String productName;
  final int productPrice;
  final int quantity;
  final int discount;
  final String productId;
  final String description;
  final List<String> images;
  final String category;

  ProductModel(
      {required this.productName,
      required this.productPrice,
      required this.quantity,
      required this.discount,
      required this.description,
      required this.images,
      required this.category,
      required this.productId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'productPrice': productPrice,
      'quantity': quantity,
      'description': description,
      'images': images,
      'category': category,
      'discount': discount,
      'productId': productId,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
  return ProductModel(
    productName: map['productName'] as String,
    productPrice: map['productPrice'] as int,
    quantity: map['quantity'] as int,
    discount: map['discount'] as int,
    description: map['description'] as String,
    productId: map['_id'] as String, // Correct mapping for productId
    category: map['category'] as String, // Correct mapping for category
    images: (map['images'] as List<dynamic>)
        .map((image) => image.toString())
        .toList(),
  );
}

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
