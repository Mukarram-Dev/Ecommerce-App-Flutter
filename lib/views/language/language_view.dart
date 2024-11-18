import 'package:ecommerce_app/config/components/custom_search_widget.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/views/language/widgets/list_view_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/components/custom_button.dart';
import '../../config/components/custom_dialog_widget.dart';
import '../../config/theme/text_theme_style.dart';
import '../../utils/gaps.dart';

class LanguageView extends HookConsumerWidget {
  final String userId;
  const LanguageView({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLang = useState<String>('English');

    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gaps.verticalGapOf(20),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Select Language',
                        style: AppTextStyles.textTitle(
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Gaps.verticalGapOf(40),
                    Text(
                      'Choose Your Language 🇬🇪',
                      style: AppTextStyles.textHeading(),
                    ),
                    Gaps.verticalGapOf(10),
                    Flexible(
                      child: Text(
                        'Please search and then choose your personal language.',
                        style: AppTextStyles.textBody(),
                      ),
                    ),
                    Gaps.verticalGapOf(30),
                    const CustomSearchWidget(title: 'Search for your language'),
                    Gaps.verticalGapOf(20),
                    ListViewLanguage(selectedLanguage: selectedLang),
                    Gaps.verticalGapOf(50),
                    CustomButtonWidget(
                      width: double.infinity,
                      height: 60,
                      title: 'Confirm',
                      onPress: () async {
                        CustomDialogWidget.dialogLoading(
                            msg: 'Adding Language...', context: context);
                      },
                    ),
                    Gaps.verticalGapOf(15),
                  ]),
            ),
          )),
    );
  }
}
