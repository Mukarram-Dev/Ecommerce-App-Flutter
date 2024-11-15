import 'package:ecommerce_app/config/components/custom_button.dart';
import 'package:ecommerce_app/config/components/custom_dialog_widget.dart';
import 'package:ecommerce_app/config/components/custom_text_field.dart';
import 'package:ecommerce_app/config/routes/routes_name.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/utils/gaps.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:ecommerce_app/views/login/widgets/password_field.dart';
import 'package:ecommerce_app/views/login/widgets/social_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final emailFocusNode = useFocusNode();
    final passwordController = useTextEditingController();
    final passwordFocusNode = useFocusNode();

    final formKey = GlobalKey<FormState>();
    // final authController = ref.read(authControllerProvider.notifier);

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
                        'Sign in',
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
                        'Please enter your username/email and password to sign In.',
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
                            onFieldSubmitted: (p0) => Utils.fieldFocusChange(
                              context,
                              emailFocusNode,
                              passwordFocusNode,
                            ),
                          ),
                          Gaps.verticalGapOf(20),
                          Text(
                            'Password',
                            style: AppTextStyles.textLabel(),
                          ),
                          Gaps.verticalGapOf(5),
                          PasswordTextFieldWidget(
                            passwordController: passwordController,
                            passwordFocusNode: passwordFocusNode,
                          ),
                        ],
                      ),
                    ),
                    Gaps.verticalGapOf(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 21,
                              width: 21,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
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
                        TextButton(
                          onPressed: () {},
                          child: Text('Forget Password?',
                              style: AppTextStyles.textLabel(
                                  color: AppColors.colorText)),
                        ),
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
                    Gaps.verticalGapOf(50),
                    CustomButtonWidget(
                      width: double.infinity,
                      height: 60,
                      title: 'Sign in',
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          CustomDialogWidget.dialogLoading(
                              msg: 'Signing...', context: context);

                          // authController.signInWithEmailAndPassword(
                          //   context,
                          //   emailController.text.trim(),
                          //   passwordController.text.trim(),
                          // );
                        }
                      },
                    ),
                    Gaps.verticalGapOf(15),
                    Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          text: 'Don\'t have an account?',
                          style: AppTextStyles.textBody(),
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => GoRouter.of(context)
                                      .pushNamed(RouteName.signUpRoute),
                                text: ' Sign up',
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
