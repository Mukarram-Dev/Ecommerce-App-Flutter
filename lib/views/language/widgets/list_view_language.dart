import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ListViewLanguage extends HookWidget {
  final ValueNotifier<String> selectedLanguage;
  const ListViewLanguage({super.key, required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final lang = AppConstants.languageList[index];
          final isSelected = selectedLanguage.value == lang.name;
          return Container(
            decoration: BoxDecoration(
              color: isSelected ? AppColors.lightGrey : AppColors.white,
              border: isSelected
                  ? Border.all(color: AppColors.lightGrey)
                  : const Border.fromBorderSide(BorderSide.none),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              onTap: () {
                selectedLanguage.value = lang.name;
              },
              minLeadingWidth: 20,
              leadingAndTrailingTextStyle: AppTextStyles.textBodyItalic(),
              leading: Text(lang.flag),
              title: Text(
                lang.name,
                style: AppTextStyles.textBodyItalic(color: AppColors.colorText),
              ),
              trailing: isSelected
                  ? const Icon(
                      Icons.check_circle,
                      color: AppColors.primaryColor,
                    )
                  : const SizedBox(),
            ),
          );
        },
        itemCount: AppConstants.languageList.length,
        shrinkWrap: true,
        primary: false,
      ),
    );
  }
}
