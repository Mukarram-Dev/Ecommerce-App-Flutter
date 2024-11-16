import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isObsecureText;
  final TextInputType textInputType;
  final String hintTitle;
  final String? Function(String?)? validator;
  final String? errorText;
  final String? labelText;
  final double paddingHorizontal;
  final double contentPaddingHorizontal;
  final Color borderColor;
  final bool enabled;
  final Widget? suffixIcon;

  final Function(String)? onFieldSubmitted;

  const CustomTextFieldWidget({
    super.key,
    this.enabled = true,
    required this.labelText,
    required this.controller,
    this.suffixIcon,
    this.isObsecureText = false,
    required this.textInputType,
    required this.hintTitle,
    this.validator,
    this.errorText,
    this.paddingHorizontal = 20,
    this.contentPaddingHorizontal = 20,
    this.borderColor = const Color(0xffa90084),
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecureText,
      enabled: enabled,
      validator: validator,
      onSaved: (value) {
        controller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: hintTitle,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        suffixIcon: suffixIcon,
      ),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
