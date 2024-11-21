import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard(
      {super.key,
      this.width = 140,
      this.aspectRetio = 1.02,
      required this.product,
      required this.onFavouritePress,
      required this.onCardPress});

  final double width, aspectRetio;
  final Product? product;
  final VoidCallback onFavouritePress;
  final VoidCallback onCardPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onCardPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withAlpha(100),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(product?.image ?? ''),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product?.name ?? '',
              style: AppTextStyles.textLabel(),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product?.price}",
                  style: AppTextStyles.textLabel(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: onFavouritePress,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: product!.isliked
                          ? const Color(0xFFFF7643).withOpacity(0.15)
                          : const Color(0xFF979797).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        product!.isliked
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: product!.isliked
                            ? const Color(0xFFFF4848)
                            : const Color(0xFFDBDEE4),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
