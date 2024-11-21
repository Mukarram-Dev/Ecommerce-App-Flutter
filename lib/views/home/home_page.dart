import 'package:ecommerce_app/config/assets/image_assets.dart';
import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:ecommerce_app/utils/gaps.dart';
import 'package:ecommerce_app/utils/size_config.dart';
import 'package:ecommerce_app/views/home/widgets/categories_widget.dart';
import 'package:ecommerce_app/views/home/widgets/home_banner_widget.dart';
import 'package:ecommerce_app/views/home/widgets/product_listview.dart';
import 'package:ecommerce_app/views/home/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final String title;

  const HomeView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _topBar(),
                Gaps.verticalGapOf(10),
                const SearchWidget(),
                Gaps.verticalGapOf(20),
                const HomeBanner(),
                Gaps.verticalGapOf(20),
                _textTile('Categories'),
                Gaps.verticalGapOf(10),
                const CategoriesWidget(),
                Gaps.verticalGapOf(10),
                _textTile('Featured'),
                Gaps.verticalGapOf(20),
                const ProductListview(),
                Gaps.verticalGapOf(40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textTile(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: AppTextStyles.textTitle(color: AppColors.black),
      ),
    );
  }

  Widget _topBar() {
    return Padding(
      padding: AppConstants.hPadding,
      child: ListTile(
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.zero,
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(ImageAssets.userPic),
        ),
        title: Text(
          'Welcome',
          style: AppTextStyles.textBody(
            color: AppColors.grey,
          ),
        ),
        subtitle: Text(
          'Mukarram',
          style: AppTextStyles.textLabel(
            fontSize: 18,
          ),
        ),
        trailing: const CircleAvatar(
          backgroundColor: AppColors.lightGrey,
          child: Center(
            child: Badge(
              backgroundColor: AppColors.primaryColor,
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      ),
    );
  }
}
