// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderModel {
  final String id;
  final String name;
  final String productName;
  final int productPrice;
  final int discount;
  final int quantity;
  final String category;
  final String image;

  OrderModel({required this.id, required this.name, required this.productName, required this.productPrice, required this.discount, required this.quantity, required this.category, required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'productName': productName,
      'productPrice': productPrice,
      'discount': discount,
      'quantity': quantity,
      'category': category,
      'image': image,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      productName: map['productName'] as String,
      productPrice: map['productPrice'] as int,
      discount: map['discount'] as int,
      quantity: map['quantity'] as int,
      category: map['category'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
