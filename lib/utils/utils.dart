import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.black,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static toastMessageCenter(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.black,
      gravity: ToastGravity.CENTER,
    );
  }

  static snackbarMsg(BuildContext context, String msg, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: const TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        behavior: SnackBarBehavior.floating,

        elevation: 6.0, // Adjust elevation for a similar shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(20),
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(context),
    );
  }
}
