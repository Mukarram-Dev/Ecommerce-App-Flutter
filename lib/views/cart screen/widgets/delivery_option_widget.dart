import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:flutter/material.dart';

class DeliveryOptionWidget extends StatelessWidget {
  const DeliveryOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildDeliveryOption(
            "Standard Delivery",
            "Order will be delivered between 3 - 5 business days",
            "Free",
            true,
          ),
          const SizedBox(height: 20),
          _buildDeliveryOption(
            "Next Day Delivery",
            "Order will be delivered between 1 Week business days",
            "\$8.00",
            false,
          ),
          const SizedBox(height: 20),
          _buildDeliveryOption(
            "Saturday Delivery",
            "Order will be delivered between 1 business day",
            "\$20.00",
            false,
          ),
        ],
      ),
    );
  }
}

Widget _buildDeliveryOption(
    String title, String subtitle, String price, bool isSelected) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border.all(color: AppColors.grey.withAlpha(300)),
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      title: Text(
        title,
        style: AppTextStyles.textHeading3(
          fontSize: 18,
          color: AppColors.black,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: Text(
        price,
        style: AppTextStyles.textHeading3(
          fontSize: 18,
          color: AppColors.black,
        ),
      ),
      leading: Radio<bool>(
        fillColor: const WidgetStatePropertyAll(AppColors.primaryColor),
        value: true,
        groupValue: isSelected,
        onChanged: (value) {},
      ),
    ),
  );
}
