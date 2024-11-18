import 'package:ecommerce_app/models/app_data.dart';
import 'package:ecommerce_app/utils/size_config.dart';
import 'package:ecommerce_app/views/details/details_screen.dart';
import 'package:ecommerce_app/views/home/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

class ProductListview extends StatefulWidget {
  const ProductListview({super.key});

  @override
  State<ProductListview> createState() => _ProductListviewState();
}

class _ProductListviewState extends State<ProductListview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: SizeConfig.screenWidth,
      child: GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 5,
          mainAxisSpacing: 30,
          crossAxisSpacing: 20,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.vertical,
        children: AppData.productList
            .map(
              (product) => ProductCard(
                product: product,
                onSelected: (model) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      product: product,
                    ),
                  ));
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
