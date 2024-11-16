import 'package:ecommerce_app/config/components/custom_button.dart';
import 'package:ecommerce_app/config/components/custom_dialog_widget.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:ecommerce_app/utils/gaps.dart';
import 'package:ecommerce_app/utils/size_config.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:ecommerce_app/views/login/widgets/divders_widget.dart';
import 'package:ecommerce_app/views/signup/widget/social_form_signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import '../login/widgets/social_container.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final authController = useAuthProvider(authControllerProvider.notifier);
    final formKey = GlobalKey<FormState>();
    final repeatPassController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final isTermsAccepted = useState<bool>(false);
    SizeConfig().init;

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gaps.verticalGapOf(SizeConfig.screenHeight! * 0.05),
                    _buildTopHeading(),
                    Gaps.verticalGapOf(40),
                    SocialFormSignup(
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      repeatPassController: repeatPassController,
                    ),
                    Gaps.verticalGapOf(30),
                    _buildAgreeCheck(isTermsAccepted),
                    Gaps.verticalGapOf(30),
                    _buildSignupBtn(context, formKey, passwordController,
                        repeatPassController, isTermsAccepted.value),
                    Gaps.verticalGapOf(15),
                    _buildAlreadyAccountTxt(context),
                    Gaps.verticalGapOf(20),
                    const DivdersWidget(),
                    Gaps.verticalGapOf(30),
                    _buildSocialRow(),
                  ]),
            ),
          )),
    );
  }
}

bool validateFields(bool isSelected, BuildContext context) {
  if (isSelected) {
    return true;
  } else {
    Utils.flushBarErrorMessage(
        'Please Accept Terms & Conditions to proceed', context);
    return false;
  }
}

Widget _buildAgreeCheck(ValueNotifier<bool> isSelected) {
  return Row(
    children: [
      GestureDetector(
        onTap: () => isSelected.value = !isSelected.value,
        child: Container(
          height: 21,
          width: 21,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: AppColors.primaryColor,
          ),
          child: isSelected.value
              ? const Icon(
                  Icons.check_rounded,
                  color: AppColors.white,
                  size: 15,
                )
              : null,
        ),
      ),
      Gaps.horizontalGapOf(10),
      Text.rich(
        TextSpan(
          text: 'Accept our',
          style: AppTextStyles.textBody(),
          children: [
            TextSpan(
                text: ' Terms & Conditions',
                style: AppTextStyles.textBodyItalic(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                )),
          ],
        ),
      ),
    ],
  );
}

Widget _buildAlreadyAccountTxt(BuildContext context) {
  return Align(
    alignment: Alignment.center,
    child: Text.rich(
      TextSpan(
        text: 'Already have an account?',
        style: AppTextStyles.textBody(),
        children: [
          TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () => context.pop(),
              text: ' Sign in',
              style: AppTextStyles.textBodyItalic(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              )),
        ],
      ),
    ),
  );
}

Widget _buildSignupBtn(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController passwordController,
    TextEditingController repeatPassController,
    bool isTermSelected) {
  return CustomButtonWidget(
    width: double.infinity,
    height: 60,
    title: 'Sign up',
    onPress: () async {
      if (formKey.currentState!.validate() &&
          AppConstants.validatePassword(
            passwordController.text,
            repeatPassController.text,
            context,
          )! &&
          validateFields(isTermSelected, context)) {
        CustomDialogWidget.dialogLoading(
            msg: 'Creating Account...', context: context);

        // await authController.signUpWithEmailAndPassword(
        //     context,
        //     emailController.text.trim(),
        //     passwordController.text.trim());
      }
    },
  );
}

Widget _buildSocialRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      socialContainer('assets/google.svg'),
      socialContainer('assets/apple.svg'),
      socialContainer('assets/fb.svg'),
    ],
  );
}

Widget _buildTopHeading() {
  return Column(
    children: [
      Text(
        "Register Account",
        style: AppTextStyles.textHeading(),
      ),
      const Text(
        "Complete your details or continue \nwith social media",
        textAlign: TextAlign.center,
      ),
    ],
  );
}
