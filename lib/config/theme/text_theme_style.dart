import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:flutter/cupertino.dart';

class AppTextStyles {
  static TextStyle textHeading({
    Color color = AppColors.primaryColor,
    double fontSize = 28,
    FontWeight fontWeight = FontWeight.bold,
    String fontFamily = 'Urbanist',
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }

  static TextStyle textTitle({
    Color color = AppColors.primaryColor,
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.bold,
    String fontFamily = 'Urbanist',
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }

  static TextStyle textBody({
    Color color = AppColors.colorText,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = 'Urbanist',
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }

  static TextStyle textBodyItalic({
    Color color = AppColors.colorText,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w600,
    String fontFamily = 'Urbanist',
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle textLabel({
    Color color = AppColors.labelColor,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w600,
    String fontFamily = 'Urbanist',
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }

  static TextStyle subheading({
    Color color = AppColors.grey,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = 'Urbanist',
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle textCaption({
    Color color = AppColors.colorText,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w600,
    String fontFamily = 'Urbanist',
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }
}
