import 'package:ecommerce_app/config/assets/image_assets.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/providers/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cart_counter.dart';

class CounterWithFavBtn extends StatelessWidget {
  final bool isLiked;
  final int productId;
  const CounterWithFavBtn({
    super.key,
    required this.isLiked,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const CartCounter(),
        Consumer(
          builder: (context, ref, child) => InkWell(
            onTap: () => ref.read(homeProvider.notifier).updateFavouriteList(
                  productId,
                  !isLiked,
                ),
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                color: AppColors.lightGrey,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                isLiked ? ImageAssets.heartFilled : ImageAssets.heartSvg,
                colorFilter: ColorFilter.mode(
                  isLiked ? AppColors.red : AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
