import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/config/components/custom_button.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/models/app_data.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CarouselSlider.builder(
        itemCount: AppData.showPromoList.length,
        itemBuilder: (context, index, realIndex) {
          final promoModel = AppData.showPromoList[index];
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.primaryColor.withAlpha(100),
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        softWrap: true,
                        textAlign: TextAlign.start,
                        promoModel.title ?? 'Promo Title',
                        style: AppTextStyles.textHeading2(
                          color: AppColors.black,
                        ),
                      ),
                      CustomButtonWidget(
                        height: 40,
                        width: 130,
                        title: 'Order Now',
                        onPress: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 40,
                  child: Image.asset(
                    promoModel.productImage ?? '',
                    height: 140,
                    width: 130,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {});
          },
        ),
      ),
    );
  }
}
