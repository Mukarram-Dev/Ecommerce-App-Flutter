import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:flutter/material.dart';

class CustomDialogWidget {
  static Future<void> dialogLoading(
      {required String msg, required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            contentPadding: const EdgeInsets.all(16),
            surfaceTintColor: Colors.black.withOpacity(0.5),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
                const SizedBox(height: 20),
                Text(msg, style: AppTextStyles.textBody())
              ],
            ));
      },
    );
  }
}
