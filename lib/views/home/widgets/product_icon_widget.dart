import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/models/product_category.dart';
import 'package:ecommerce_app/utils/gaps.dart';
import 'package:flutter/material.dart';

class ProductIcon extends StatelessWidget {
  final VoidCallback onSelected;
  final ProductCategory model;

  const ProductIcon({
    super.key,
    required this.model,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (model.id == null) return const SizedBox(width: 5);

    return GestureDetector(
      onTap: onSelected,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 20,
            ),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withAlpha(200),
                borderRadius: BorderRadius.circular(20),
                border: model.isSelected!
                    ? Border.all(
                        color: AppColors.black,
                      )
                    : null,
              ),
              child: Center(
                child: Image.asset(
                  model.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Gaps.verticalGapOf(10),
          Text(
            model.name!,
            style: AppTextStyles.textLabel(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color:
                  model.isSelected! ? AppColors.primaryColor : AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
