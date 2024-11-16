import 'package:ecommerce_app/config/assets/image_assets.dart';
import 'package:ecommerce_app/config/components/custom_suffix_icon.dart';
import 'package:ecommerce_app/config/components/custom_text_field.dart';
import 'package:ecommerce_app/utils/gaps.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:ecommerce_app/views/login/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SigninFormWidget extends HookWidget {
  final GlobalKey<FormState> formKey;
  const SigninFormWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final emailFocusNode = useFocusNode();
    final passwordController = useTextEditingController();
    final passwordFocusNode = useFocusNode();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEmailTextField(
            context,
            emailController,
            emailFocusNode,
            passwordFocusNode,
          ),
          Gaps.verticalGapOf(20),
          PasswordTextFieldWidget(
            passwordController: passwordController,
            passwordFocusNode: passwordFocusNode,
          ),
        ],
      ),
    );
  }
}

Widget _buildEmailTextField(
    BuildContext context,
    TextEditingController emailController,
    FocusNode emailFocusNode,
    FocusNode passwordFocusNode) {
  return CustomTextFieldWidget(
    controller: emailController,
    textInputType: TextInputType.emailAddress,
    hintTitle: 'Enter your email',
    labelText: "Email",
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
    onFieldSubmitted: (p0) => Utils.fieldFocusChange(
      context,
      emailFocusNode,
      passwordFocusNode,
    ),
  );
}
