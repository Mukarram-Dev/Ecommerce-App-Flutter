import 'package:ecommerce_app/models/app_data.dart';
import 'package:ecommerce_app/utils/size_config.dart';
import 'package:ecommerce_app/views/home/widgets/product_icon_widget.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight! * .13,
        child: ListView.builder(
          itemCount: AppData.categoryList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ProductIcon(
            model: AppData.categoryList[index],
            onSelected: (model) {
              setState(() {
                for (var item in AppData.categoryList) {
                  item.isSelected = false;
                }
                model.isSelected = true;
              });
            },
          ),
        ));
  }
}
