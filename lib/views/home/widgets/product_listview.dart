import 'package:ecommerce_app/providers/home/home_provider.dart';
import 'package:ecommerce_app/utils/size_config.dart';
import 'package:ecommerce_app/views/details/details_screen.dart';
import 'package:ecommerce_app/views/home/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListview extends ConsumerWidget {
  const ProductListview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(getProductListProvider);

    return productList.isEmpty
        ? const Center(
            child: Text('No Product Found'),
          )
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: SizeConfig.screenWidth,
            child: GridView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) => ProductCard(
                product: productList[index],
                onSelected: (model) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      product: productList[index],
                    ),
                  ));
                },
                onFavouritePress: () => ref
                    .read(homeProvider.notifier)
                    .updateFavouriteList(
                        productList[index].id, !productList[index].isliked),
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 30,
                crossAxisSpacing: 20,
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              scrollDirection: Axis.vertical,
            ),
          );
  }
}
