import 'package:ecommerce_app/config/theme/colors.dart';
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
    final isObsecureText = useState<bool>(false);

    return TextFormField(
      focusNode: passwordFocusNode,
      controller: passwordController,
      obscureText: isObsecureText.value,
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
        focusedBorder: const UnderlineInputBorder(),
        hintText: '*************',
        hintStyle: const TextStyle(letterSpacing: 1.0, color: AppColors.grey1),
        suffixIcon: IconButton(
          onPressed: () {
            isObsecureText.value = !isObsecureText.value;
          },
          icon: Icon(isObsecureText.value
              ? Icons.visibility_off
              : Icons.remove_red_eye_sharp),
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
