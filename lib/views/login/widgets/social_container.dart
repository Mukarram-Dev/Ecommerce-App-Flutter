import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget socialContainer(String img) {
  return Container(
    width: 100,
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    decoration: BoxDecoration(
        color: AppColors.socialbg,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        border: Border.all(color: AppColors.lightGrey)),
    child: Center(
      child: SvgPicture.asset(img),
    ),
  );
}
