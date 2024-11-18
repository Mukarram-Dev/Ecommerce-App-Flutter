import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: AppConstants.kdefaultPadding),
      child: Text(
        product.descriptiom,
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}
