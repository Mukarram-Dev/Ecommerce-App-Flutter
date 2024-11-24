import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/models/app_data.dart';
import 'package:ecommerce_app/utils/gaps.dart';
import 'package:ecommerce_app/views/cart%20screen/widgets/address_cardview.dart';
import 'package:ecommerce_app/views/cart%20screen/widgets/cart_listview.dart';
import 'package:ecommerce_app/views/cart%20screen/widgets/checkout_card.dart';
import 'package:ecommerce_app/views/cart%20screen/widgets/delivery_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _pageController = PageController();
  int activePage = 0;

  void _onCategoryTap(int index) {
    setState(() {
      activePage = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Your Order",
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 100),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  rowItems.length,
                  (index) {
                    final item = rowItems[index];
                    return GestureDetector(
                      onTap: () => _onCategoryTap(index),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: item.isSelected
                                  ? AppColors.primaryColor
                                  : AppColors.lightGrey,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                item.processIcon,
                                height: 30,
                              ),
                            ),
                          ),
                          Gaps.verticalGapOf(10),
                          Text(
                            item.processTile,
                            style: AppTextStyles.textLabel(
                              color: item.isSelected
                                  ? AppColors.primaryColor
                                  : AppColors.colorText,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            )),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: orderprocssingWidget.length,
        onPageChanged: (int page) {
          setState(() {
            activePage = page;
          });
        },
        itemBuilder: (context, index) {
          return orderprocssingWidget[index];
        },
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: CheckoutCard(),
      ),
    );
  }
}

List<Widget> orderprocssingWidget = [
  const CartListview(),
  const Center(child: AddressCardview()),
  const Center(
    child: DeliveryOptionWidget(),
  )
];
