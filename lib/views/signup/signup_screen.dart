import 'package:ecommerce_app/config/components/custom_button.dart';
import 'package:ecommerce_app/config/components/custom_dialog_widget.dart';
import 'package:ecommerce_app/config/components/custom_text_field.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/utils/gaps.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:ecommerce_app/views/signup/widget/password_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import '../login/widgets/social_container.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repeatPassController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    // final authController = useAuthProvider(authControllerProvider.notifier);
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
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
                        'Sign up',
                        style: AppTextStyles.textTitle(
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Gaps.verticalGapOf(40),
                    Text(
                      'Hello there 👋',
                      style: AppTextStyles.textHeading(),
                    ),
                    Gaps.verticalGapOf(10),
                    Flexible(
                      child: Text(
                        'Please enter your username/email and password to sign up.',
                        style: AppTextStyles.textBody(),
                      ),
                    ),
                    Gaps.verticalGapOf(40),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username / Email',
                            style: AppTextStyles.textLabel(),
                          ),
                          Gaps.verticalGapOf(5),
                          CustomTextFieldWidget(
                            labelText: 'email',
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                            hintTitle: 'john@gmail.com',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter Your Email");
                              }
                              // reg expression for email validation
                              else if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please Enter a valid email");
                              }
                              return null;
                            },
                          ),
                          Gaps.verticalGapOf(20),
                          Text(
                            'Password',
                            style: AppTextStyles.textLabel(),
                          ),
                          Gaps.verticalGapOf(5),
                          PasswordFieldWidgetSignup(
                            passwordController: passwordController,
                          ),
                          Gaps.verticalGapOf(20),
                          Text(
                            'Repeat Password',
                            style: AppTextStyles.textLabel(),
                          ),
                          Gaps.verticalGapOf(5),
                          PasswordFieldWidgetSignup(
                            passwordController: repeatPassController,
                          ),
                        ],
                      ),
                    ),
                    Gaps.verticalGapOf(30),
                    Row(
                      children: [
                        Container(
                          height: 21,
                          width: 21,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.primaryColor,
                          ),
                          child: const Icon(
                            Icons.check_rounded,
                            color: AppColors.white,
                            size: 15,
                          ),
                        ),
                        Gaps.horizontalGapOf(10),
                        Text(
                          'Remember me',
                          style: AppTextStyles.textLabel(
                              color: AppColors.colorText),
                        )
                      ],
                    ),
                    Gaps.verticalGapOf(20),
                    const Divider(
                      color: AppColors.lightGrey,
                    ),
                    Gaps.verticalGapOf(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1,
                          width: 90,
                          color: AppColors.lightGrey,
                        ),
                        Gaps.horizontalGapOf(10),
                        Text(
                          'or continue with',
                          style: AppTextStyles.textCaption(),
                        ),
                        Gaps.horizontalGapOf(20),
                        Container(
                          height: 1,
                          color: AppColors.lightGrey,
                          width: 90,
                        ),
                      ],
                    ),
                    Gaps.verticalGapOf(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        socialContainer('assets/google.svg'),
                        socialContainer('assets/apple.svg'),
                        socialContainer('assets/fb.svg'),
                      ],
                    ),
                    Gaps.verticalGapOf(30),
                    CustomButtonWidget(
                      width: double.infinity,
                      height: 60,
                      title: 'Sign up',
                      onPress: () async {
                        if (formKey.currentState!.validate() &&
                            validatePassword(passwordController.text,
                                repeatPassController.text, context)!) {
                          CustomDialogWidget.dialogLoading(
                              msg: 'Creating Account...', context: context);

                          // await authController.signUpWithEmailAndPassword(
                          //     context,
                          //     emailController.text.trim(),
                          //     passwordController.text.trim());
                        }
                      },
                    ),
                    Gaps.verticalGapOf(15),
                    Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          text: 'Already have an account?',
                          style: AppTextStyles.textBody(),
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => context.pop(),
                                text: ' Sign in',
                                style: AppTextStyles.textBodyItalic(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}

String? validateName(String? value) {
  if (value!.isEmpty) {
    return "Full Name cannot be Empty";
  }
  if (value.length < 3) {
    return "Enter Valid name (Min. 3 Characters)";
  }
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return "Phone number cannot be empty";
  }
  if (!RegExp(r'^\d+$').hasMatch(value)) {
    return "Phone number can only contain digits";
  }
  if (value.length < 10 || value.length > 15) {
    return "Enter a valid phone number (10-15 digits)";
  }
  return null;
}

String? validateEmail(String? value) {
  if (value!.isEmpty) {
    return "Please Enter Your Email";
  }
  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
    return "Please Enter a valid email";
  }
  return null;
}

bool? validatePassword(String? value, String? val2, BuildContext context) {
  if (value == val2) {
    return true;
  } else {
    Utils.flushBarErrorMessage('Password not same', context);
    return false;
  }
}
