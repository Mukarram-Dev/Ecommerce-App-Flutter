import 'package:ecommerce_app/config/assets/image_assets.dart';
import 'package:ecommerce_app/config/components/custom_button.dart';
import 'package:ecommerce_app/config/routes/routes_name.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ThankSheetWidget extends StatelessWidget {
  const ThankSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              ImageAssets.gift2Icon,
              height: 60,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            Text(
              'Thanks You For Shopping at Lathania',
              style: AppTextStyles.textHeading3(
                color: AppColors.black,
              ),
            ),
            Text(
              'We have received your order and will send you a confirmation email with your track & trace details as soon as your order ships',
              softWrap: true,
              textAlign: TextAlign.center,
              style: AppTextStyles.textBody(),
            ),
            CustomButtonWidget(
                title: 'Continue Shopping',
                onPress: () {
                  context.goNamed(RouteName.mainRoute);
                }),
          ],
        ),
      ),
    );
  }
}
