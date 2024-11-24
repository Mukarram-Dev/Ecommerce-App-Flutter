import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/models/language_model.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static final languageList = <Language>[
    Language(name: 'English', flag: '🇬🇪'),
    Language(name: 'Italian', flag: '🇹🇫'),
    Language(name: 'Chinese', flag: '🇨🇴'),
    Language(name: 'French', flag: '🇨🇬'),
    Language(name: 'German', flag: '🇩🇪'),
    Language(name: 'Spanish', flag: '🇨🇰'),
  ];

  static bool? validatePassword(
      String? value, String? val2, BuildContext context) {
    if (value == val2) {
      return true;
    } else {
      Utils.flushBarErrorMessage('Password not same', context);
      return false;
    }
  }

  static List<BoxShadow> shadow = <BoxShadow>[
    const BoxShadow(
      color: AppColors.grey1,
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
  ];

  static EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static const kdefaultPadding = 20.0;

  static const preferencesCart = 'AddToCartBox';

  static const placeHolder =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScQ444UXmuzxNg14VwMKOxNNN67p4AGU2gUw&s';
}
