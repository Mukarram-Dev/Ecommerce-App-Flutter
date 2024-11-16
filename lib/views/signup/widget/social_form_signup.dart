import 'package:ecommerce_app/config/assets/image_assets.dart';
import 'package:ecommerce_app/config/components/custom_suffix_icon.dart';
import 'package:ecommerce_app/config/components/custom_text_field.dart';
import 'package:ecommerce_app/utils/gaps.dart';
import 'package:ecommerce_app/views/signup/widget/password_field.dart';
import 'package:flutter/material.dart';

class SocialFormSignup extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController repeatPassController;
  final TextEditingController emailController;

  const SocialFormSignup({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.repeatPassController,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _builEmailTextField(context, emailController),
          Gaps.verticalGapOf(20),
          PasswordFieldWidgetSignup(
            passwordController: passwordController,
            labelText: 'Password',
            hintText: 'Enter Password',
          ),
          Gaps.verticalGapOf(20),
          PasswordFieldWidgetSignup(
            passwordController: repeatPassController,
            labelText: 'Confirm Password',
            hintText: 'Re-enter your password',
          ),
        ],
      ),
    );
  }

  Widget _builEmailTextField(
    BuildContext context,
    TextEditingController emailController,
  ) {
    return CustomTextFieldWidget(
      labelText: 'Email',
      controller: emailController,
      textInputType: TextInputType.emailAddress,
      hintTitle: 'Enter your email',
      suffixIcon: const CustomSuffixIcon(
        svgIcon: ImageAssets.mailSvg,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
    );
  }
}
