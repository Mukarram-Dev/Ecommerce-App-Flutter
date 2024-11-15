import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/text_theme_style.dart';

class SearchWidget extends StatelessWidget {
  final String title;
  const SearchWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.socialbg,
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(

        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            hintText: title,
            hintStyle: AppTextStyles.textBodyItalic(color: AppColors.grey),
            fillColor: AppColors.socialbg,
            focusColor: AppColors.primaryColor,

            border: InputBorder.none,
            suffixIcon: const Icon(Icons.search)
        ),
      ),
    );
  }
}
