import 'package:ecommerce_app/config/assets/image_assets.dart';
import 'package:ecommerce_app/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../theme/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(title),
      titleSpacing: 20,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton.filled(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                AppColors.lightGrey,
              )),
              onPressed: () {
                context.pushNamed(RouteName.cartRoute);
              },
              icon: SvgPicture.asset(
                ImageAssets.cart2Svg,
              )),
        ),
      ],
    );
  }
}
