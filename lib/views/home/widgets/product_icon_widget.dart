import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/models/product_category.dart';
import 'package:flutter/material.dart';

class ProductIcon extends StatelessWidget {
  final ValueChanged<ProductCategory> onSelected;
  final ProductCategory model;

  const ProductIcon({
    super.key,
    required this.model,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (model.id == null) return const SizedBox(width: 5);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (model.image != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Image.asset(
                  model.image!,
                  fit: BoxFit.cover,
                  scale: 0.7,
                ),
              ),
            ),
          ),
        if (model.name != null)
          Text(
            model.name!,
            style: AppTextStyles.textLabel(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
      ],
    );
  }
}
