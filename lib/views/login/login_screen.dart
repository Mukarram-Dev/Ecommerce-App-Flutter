import 'package:ecommerce_app/config/components/custom_button.dart';
import 'package:ecommerce_app/config/components/custom_dialog_widget.dart';
import 'package:ecommerce_app/config/routes/routes_name.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/utils/gaps.dart';
import 'package:ecommerce_app/utils/size_config.dart';
import 'package:ecommerce_app/views/login/widgets/divders_widget.dart';
import 'package:ecommerce_app/views/login/widgets/signin_form_widget.dart';
import 'package:ecommerce_app/views/login/widgets/social_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig().init(context);
    final formKey = GlobalKey<FormState>();
    // final authController = ref.read(authControllerProvider.notifier);

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
                    Gaps.verticalGapOf(SizeConfig.screenHeight! * 0.08),
                    Text(
                      "Welcome Back",
                      style: AppTextStyles.textHeading(),
                    ),
                    const Text(
                      "Sign in with your email and password",
                      textAlign: TextAlign.center,
                    ),
                    Gaps.verticalGapOf(SizeConfig.screenHeight! * 0.08),
                    SigninFormWidget(formKey: formKey),
                    _buildForgetText(),
                    Gaps.verticalGapOf(50),
                    _buildSiginButton(context, formKey),
                    Gaps.verticalGapOf(15),
                    _buildTextSignup(context),
                    Gaps.verticalGapOf(40),
                    const DivdersWidget(),
                    Gaps.verticalGapOf(30),
                    _buildContainerRow(),
                  ]),
            ),
          )),
    );
  }
}

Widget _buildTextSignup(BuildContext context) {
  return Align(
    alignment: Alignment.center,
    child: Text.rich(
      TextSpan(
        text: 'Don\'t have an account?',
        style: AppTextStyles.textBody(),
        children: [
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap =
                    () => GoRouter.of(context).pushNamed(RouteName.signUpRoute),
              text: ' Sign up',
              style: AppTextStyles.textBodyItalic(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              )),
        ],
      ),
    ),
  );
}

Widget _buildContainerRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      socialContainer('assets/google.svg'),
      socialContainer('assets/apple.svg'),
      socialContainer('assets/fb.svg'),
    ],
  );
}

Widget _buildSiginButton(BuildContext context, GlobalKey<FormState> formKey) {
  return CustomButtonWidget(
    width: double.infinity,
    height: 60,
    title: 'Sign in',
    onPress: () async {
      if (formKey.currentState!.validate()) {
        CustomDialogWidget.dialogLoading(
          msg: 'Signing...',
          context: context,
        );

        await Future.delayed(const Duration(seconds: 3));

        context.pushReplacementNamed(RouteName.homeRoute);

        // authController.signInWithEmailAndPassword(
        //   context,
        //   emailController.text.trim(),
        //   passwordController.text.trim(),
        // );
      }
    },
  );
}

Widget _buildForgetText() {
  return Align(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () {},
      child: Text('Forget Password?', style: AppTextStyles.textBody()),
    ),
  );
}
