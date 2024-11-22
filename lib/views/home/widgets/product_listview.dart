import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/providers/home/home_provider.dart';
import 'package:ecommerce_app/views/details/details_screen.dart';
import 'package:ecommerce_app/views/home/widgets/product_card_widget.dart';

class ProductListview extends ConsumerWidget {
  const ProductListview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(getProductListProvider);

    return productList.isEmpty
        ? const Center(
            child: Text('No Product Found'),
          )
        : LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              const crossAxisCount = 2;
              final cardWidth = (screenWidth - 40) / crossAxisCount;
              final cardHeight = cardWidth * 1.55;
              final childAspectRatio = cardWidth / cardHeight;

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: screenWidth,
                child: GridView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) => ProductCard(
                    product: productList[index],
                    onSelected: (model) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: productList[index],
                          ),
                        ),
                      );
                    },
                    onFavouritePress: () =>
                        ref.read(homeProvider.notifier).updateFavouriteList(
                              productList[index].id,
                              !productList[index].isliked,
                            ),
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 20,
                    childAspectRatio: childAspectRatio,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              );
            },
          );
  }
}
