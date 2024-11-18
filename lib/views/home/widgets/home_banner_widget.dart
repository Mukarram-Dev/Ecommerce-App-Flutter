import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/config/assets/image_assets.dart';
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
        itemCount: 1,
        itemBuilder: (context, index, realIndex) {
          const imageUrl = ImageAssets.eventPic;
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(imageUrl, fit: BoxFit.cover),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: false,
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
