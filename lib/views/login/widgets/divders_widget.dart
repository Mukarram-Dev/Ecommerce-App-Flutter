import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/utils/gaps.dart';
import 'package:flutter/material.dart';

class DivdersWidget extends StatelessWidget {
  const DivdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: AppColors.lightGrey,
        ),
        Gaps.verticalGapOf(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1,
              width: 90,
              color: AppColors.lightGrey,
            ),
            Gaps.horizontalGapOf(10),
            Text(
              'or continue with',
              style: AppTextStyles.textCaption(),
            ),
            Gaps.horizontalGapOf(20),
            Container(
              height: 1,
              color: AppColors.lightGrey,
              width: 90,
            ),
          ],
        ),
      ],
    );
  }
}
