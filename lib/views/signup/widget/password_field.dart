import 'package:ecommerce_app/config/assets/image_assets.dart';
import 'package:ecommerce_app/config/components/custom_suffix_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordFieldWidgetSignup extends HookWidget {
  final TextEditingController passwordController;
  final String labelText;
  final String hintText;
  const PasswordFieldWidgetSignup({
    super.key,
    required this.passwordController,
    required this.labelText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        labelText: labelText,
        suffixIcon: const CustomSuffixIcon(svgIcon: ImageAssets.lockSvg),
      ),
    );
  }
}
