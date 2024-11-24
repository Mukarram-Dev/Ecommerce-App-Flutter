import 'package:ecommerce_app/config/components/custom_text_field.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class AddressCardview extends StatelessWidget {
  const AddressCardview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
              _buildField('Delivery Address', 'Rua de Cedofeita 123', true),
              _buildField('Postal Code', '4000-123', true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: _buildField('City', 'Porto', true),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    flex: 1,
                    child: _buildField('District', 'Porto', true),
                  ),
                ],
              ),
            ],
          ),
        ),
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
