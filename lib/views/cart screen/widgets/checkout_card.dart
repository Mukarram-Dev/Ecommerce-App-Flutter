import 'package:ecommerce_app/config/components/custom_button.dart';
import 'package:ecommerce_app/config/routes/routes_name.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 15,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 4,
            color: AppColors.grey1,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "\$337.15",
                        style: AppTextStyles.textHeading3(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomButtonWidget(
                  height: 60,
                  onPress: () {
                    context.pushNamed(RouteName.checkoutRoute);
                  },
                  title: 'Proceed',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
