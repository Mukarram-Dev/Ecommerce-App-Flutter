import 'package:ecommerce_app/config/assets/image_assets.dart';
import 'package:ecommerce_app/providers/cart/cart_provider.dart';
import 'package:ecommerce_app/views/cart%20screen/widgets/cart_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class CartListview extends ConsumerWidget {
  const CartListview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Dismissible(
          key: Key(cartItems[index].productId.toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) async {
            await ref
                .read(cartProvider.notifier)
                .deleteItemFromCart(cartItems[index].key ?? 0);
          },
          background: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE6E6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Spacer(),
                SvgPicture.asset(ImageAssets.deleteSvg),
              ],
            ),
          ),
          child: CartCard(cart: cartItems[index]),
        ),
      ),
    );
  }
}
