import 'package:ecommerce_app/config/assets/image_assets.dart';
import 'package:ecommerce_app/config/components/custom_suffix_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordTextFieldWidget extends HookWidget {
  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  const PasswordTextFieldWidget({
    super.key,
    required this.passwordController,
    required this.passwordFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: passwordFocusNode,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        } else if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        hintText: "Enter your password",
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: ImageAssets.lockSvg,
        ),
      ),
    );
  }
}
