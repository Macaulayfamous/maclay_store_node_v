class CartModel {
  final String productName;
  final int productPrice;
  final String categoryName;
  final List imageUrl;
  final String productId;
  int quantity;
  final int discount;
  final String description;

  CartModel({
    required this.productName,
    required this.productPrice,
    required this.categoryName,
    required this.imageUrl,
    required this.quantity,
    required this.productId,
    required this.discount,
    required this.description,
  });

  // Convert CartModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'categoryName': categoryName,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'productId': productId,
      'discount': discount,
      'description': description,
    };
  }

  // Deserialize JSON data into CartModel object
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productName: json['productName'],
      productPrice: json['productPrice'],
      categoryName: json['categoryName'],
      imageUrl: List.from(json['imageUrl']),
      quantity: json['quantity'],
      productId: json['productId'],
      discount: json['discount'],
      description: json['description'],
    );
  }
}
