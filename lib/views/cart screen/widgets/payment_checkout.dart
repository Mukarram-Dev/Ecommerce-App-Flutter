import 'package:ecommerce_app/config/components/custom_text_field.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/providers/order%20process/order_provider.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class PaymentCheckoutView extends ConsumerWidget {
  const PaymentCheckoutView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderState = ref.watch(orderProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                orderState.paymentMethodList.length,
                (index) {
                  final payment = orderState.paymentMethodList[index];

                  return GestureDetector(
                    onTap: () => ref.read(orderProvider.notifier).updatePayment(
                          index,
                          payment.paymentTitle,
                        ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: payment.isSelected
                            ? AppColors.primaryColor
                            : AppColors.white,
                        boxShadow: AppConstants.shadow,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          payment.icon,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  );
                },
              )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.grey.withAlpha(300)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildField('Name', 'John Smith', true),
                  _buildField('Card Number', '1234 5678 9087 5231', true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: _buildField('Expire Date', '05/20', true),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        flex: 1,
                        child: _buildField('Security Code', '123', true),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(String label, String value, bool hasCheckmark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: CustomTextFieldWidget(
        labelText: label,
        controller: TextEditingController(),
        textInputType: TextInputType.text,
        hintTitle: value,
      ),
    );
  }
}
