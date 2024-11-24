import 'package:ecommerce_app/models/hive/cart_hive/cart_hive.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final cartProvider = StateNotifierProvider<CartProvider, List<AddToCart>>(
  (ref) => CartProvider([]),
);

class CartProvider extends StateNotifier<List<AddToCart>> {
  CartProvider(super._state) {
    fetchCartItems();
  }

  Future<void> addItemToCart(
    AddToCart items,
  ) async {
    try {
      final hiveCart = Hive.box<AddToCart>(AppConstants.preferencesCart);

      final existingItem = hiveCart.get(items.productId);
      if (existingItem != null) {
        // Update the existing item if needed
        await hiveCart.put(items.productId, existingItem);
      } else {
        final key = await hiveCart.add(items);
        items.key = key;
        await hiveCart.put(key, items);
      }

      // Helper.snackbarMsg(context, 'Item added To Cart', 'Cart', 150);
      fetchCartItems();
    } catch (e) {
      debugPrint("Error adding item to cart: ${e.toString()}");
      // Helper.flushBarErrorMessage('Failed to add to cart', context);
    }
  }

  Future<void> deleteItemFromCart(int key) async {
    try {
      final hiveCart = Hive.box<AddToCart>(AppConstants.preferencesCart);
      await hiveCart.delete(key).then(
        (value) async {
          await fetchCartItems();
        },
      );
    } catch (e) {
      debugPrint("Error deleting cart item: ${e.toString()}");
    }
  }

  Future<void> fetchCartItems() async {
    try {
      final hiveCart = Hive.box<AddToCart>(AppConstants.preferencesCart);
      final cartItems = hiveCart.values.toList();

      state = cartItems;
    } catch (e) {
      debugPrint("Error fetching cart items: ${e.toString()}");
    }
  }
}
