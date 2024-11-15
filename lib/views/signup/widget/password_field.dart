import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordFieldWidgetSignup extends HookWidget {
  final TextEditingController passwordController;
  const PasswordFieldWidgetSignup({
    super.key,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    final isObsecureText = useState<bool>(false);

    return TextFormField(
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
        hintText: '*********',
        hintStyle: const TextStyle(letterSpacing: 1.0, color: AppColors.grey1),
        suffixIcon: IconButton(
          onPressed: () {
            isObsecureText.value = !isObsecureText.value;
          },
          icon: Icon(
              isObsecureText.value ? Icons.visibility_off : Icons.visibility),
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
