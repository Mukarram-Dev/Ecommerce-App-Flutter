import 'package:flutter/material.dart';

@immutable
class AppColors {
//Primary Colors

  static const primaryColor = Color(0xFFFF7643);
  static const primaryLightColor = Color(0xFFFFECDF);
  static const primaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  );
  static const secondaryColor = Color(0xFF979797);

  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFD30F0F);
  static const Color orange = Color(0xFFD36E0F);
  static const Color hintText = Color(0xff8A8A8E);
  static const Color lightGrey = Color(0xffEEEEEE);
  static const Color grey1 = Color(0xff8A8A8E);
  static const Color grey = Color(0xff5F5F5F);
  static const Color labelColor = Color(0xff0D0D0D);
  static const Color socialbg = Color(0xffFAFAFA);
  static const Color colorText = Color(0xFF757575);
  static const Color dividerColor = Color(0x1FFFFFFF);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
}
