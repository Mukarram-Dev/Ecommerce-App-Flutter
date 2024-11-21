import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/models/hive/cart_hive/cart_hive.dart';
import 'package:ecommerce_app/providers/cart/cart_provider.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:ecommerce_app/views/details/components/cart_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/product.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.hPadding,
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: AppConstants.kdefaultPadding),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppColors.primaryLightColor,
              ),
            ),
            child: Consumer(
              builder: (context, ref, child) => IconButton(
                icon: SvgPicture.asset(
                  "assets/svg/add_to_cart.svg",
                  colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor, BlendMode.srcIn),
                ),
                onPressed: () async {
                  int count = ref.watch(countProvider);
                  await ref
                      .read(cartProvider.notifier)
                      .addItemToCart(AddToCart(
                        userId: 0,
                        productId: product.id,
                        productName: product.name,
                        productCount: count,
                        productPrice: product.price,
                        productImage: product.image,
                      ))
                      .then(
                    (value) {
                      Utils.snackbarMsg(context, "Item Added To Cart", '');
                    },
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                backgroundColor: AppColors.primaryColor,
              ),
              child: Text(
                "Buy  Now".toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
