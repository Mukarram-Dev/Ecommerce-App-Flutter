import 'package:flutter/material.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/utils/extensions.dart';
import 'package:ecommerce_app/utils/gaps.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final ValueChanged<Product> onSelected;
  final VoidCallback onFavouritePress;

  const ProductCard({
    super.key,
    required this.product,
    required this.onSelected,
    required this.onFavouritePress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.primaryLightColor,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopImage(),
          Gaps.verticalGapOf(10),
          _buildBottomText(),
        ],
      ),
    );
  }

  Widget _buildTopImage() {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 160,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withAlpha(100),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Image.asset(
              product.image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: InkWell(
            onTap: onFavouritePress,
            child: Icon(
              product.isliked ? Icons.favorite : Icons.favorite_border,
              color: product.isliked ? AppColors.red : AppColors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            product.name,
            style: AppTextStyles.textHeading3(
              color: AppColors.black,
              fontSize: 16, // Adjust font size if needed
            ),
          ),
          Gaps.verticalGapOf(5),
          Text(
            '\$${product.price.toString()}',
            style: AppTextStyles.textLabel(
              fontSize: 18,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ).ripple(
        () => onSelected(product),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
