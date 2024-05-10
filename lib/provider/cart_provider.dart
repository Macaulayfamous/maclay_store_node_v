import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maclay_shop_node_project/models/cart_models.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, Map<String, CartModel>>(
        (ref) => CartNotifier());

class CartNotifier extends StateNotifier<Map<String, CartModel>> {
  CartNotifier() : super({});

  void addProductToCart({
    required String productName,
    required int productPrice,
    required String categoryName,
    required List imageUrl,
    required int quantity,
    required String productId,
    required int discount,
    required String description,
  }) {
    if (state.containsKey(productId)) {
      state = {
        ...state,
        productId: CartModel(
          productId: state[productId]!.productId,
          productName: state[productId]!.productName,
          productPrice: state[productId]!.productPrice,
          categoryName: state[productId]!.categoryName,
          quantity: state[productId]!.quantity + 1,
          imageUrl: state[productId]!.imageUrl,
          discount: state[productId]!.discount,
          description: state[productId]!.description,
        )
      };
    } else {
      state = {
        ...state,
        productId: CartModel(
          productName: productName,
          productPrice: productPrice,
          categoryName: categoryName,
          imageUrl: imageUrl,
          quantity: quantity,
          productId: productId,
          discount: discount,
          description: description,
        )
      };
    }
  }

  void decrementItem(String productId) {
    if (state.containsKey(productId)) {
      state[productId]!.quantity--;

      ///notify listeners that the state has changed
      ///
      state = {...state};
    }
  }

  void removeItem(String productId) {
    state.remove(productId);

    state = {...state};
  }

  void incrementItem(String productId) {
    if (state.containsKey(productId)) {
      state[productId]!.quantity++;

      ///notify listeners that the state has changed
      ///
      state = {...state};
    }
  }

  double calculateTotalAmount() {
    double totalAmount = 0.0;
    state.forEach((productId, cartItem) {
      totalAmount += cartItem.quantity * cartItem.discount;
    });

    return totalAmount;
  }

  Map<String, CartModel> get getCartItems => state;
}
