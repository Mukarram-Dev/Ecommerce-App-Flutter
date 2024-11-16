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
}
