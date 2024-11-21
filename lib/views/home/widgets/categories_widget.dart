import 'package:ecommerce_app/providers/home/home_provider.dart';
import 'package:ecommerce_app/utils/size_config.dart';
import 'package:ecommerce_app/views/home/widgets/product_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesWidget extends ConsumerWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryList = ref.watch(homeProvider).categoryList;

    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight! * .13,
      child: ListView.builder(
        itemCount: categoryList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ProductIcon(
          model: categoryList[index],
          onSelected: () {
            ref.read(homeProvider.notifier).updateCategory(index);
          },
        ),
      ),
    );
  }
}
