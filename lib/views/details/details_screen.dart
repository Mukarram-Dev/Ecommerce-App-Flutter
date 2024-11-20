import 'package:ecommerce_app/config/assets/image_assets.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:ecommerce_app/utils/gaps.dart';
import 'package:ecommerce_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/product.dart';
import 'components/add_to_cart.dart';
import 'components/color_and_size.dart';
import 'components/counter_with_fav_btn.dart';
import 'components/description.dart';
import 'components/product_title_with_image.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init;
    return Scaffold(
      bottomSheet: BottomSheet(
        onClosing: () {},
        elevation: 5,
        constraints: BoxConstraints(
          minHeight: SizeConfig.screenHeight! * 0.12,
        ),
        builder: (context) => AddToCartWidget(
          product: product,
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/svg/back.svg',
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(ImageAssets.cart),
            onPressed: () {},
          ),
          const SizedBox(width: AppConstants.kdefaultPadding / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: SizeConfig.screenHeight,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: SizeConfig.screenHeight,
                    margin:
                        EdgeInsets.only(top: SizeConfig.screenHeight! * 0.3),
                    padding: EdgeInsets.only(
                      top: SizeConfig.screenHeight! * 0.08,
                      left: AppConstants.kdefaultPadding,
                      right: AppConstants.kdefaultPadding,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ColorAndSize(product: product),
                        Gaps.verticalGapOf(AppConstants.kdefaultPadding / 0.6),
                        Description(product: product),
                        Gaps.verticalGapOf(
                          AppConstants.kdefaultPadding / 0.6,
                        ),
                        const CounterWithFavBtn(),
                      ],
                    ),
                  ),
                  ProductTitleWithImage(product: product),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
