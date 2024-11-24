import 'package:ecommerce_app/config/theme/colors.dart';
import 'package:ecommerce_app/config/theme/text_theme_style.dart';
import 'package:ecommerce_app/models/app_data.dart';
import 'package:ecommerce_app/providers/order%20process/order_provider.dart';
import 'package:ecommerce_app/utils/gaps.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:ecommerce_app/views/cart%20screen/widgets/address_cardview.dart';
import 'package:ecommerce_app/views/cart%20screen/widgets/cart_listview.dart';
import 'package:ecommerce_app/views/cart%20screen/widgets/checkout_card.dart';
import 'package:ecommerce_app/views/cart%20screen/widgets/delivery_option_widget.dart';
import 'package:ecommerce_app/views/cart%20screen/widgets/payment_checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  final _pageController = PageController();

  void _onCategoryTap(int index) {
    ref.read(orderProvider.notifier).updatePage(index);

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orderState = ref.watch(orderProvider);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => _onCategoryTap(0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.5,
          shadowColor: AppColors.grey1,
          surfaceTintColor: AppColors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          )),
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
                      final item = orderState.ordperProcessList[index];
                      return GestureDetector(
                        onTap: () => _onCategoryTap(index),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: orderState.activePage == index
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
                                color: orderState.activePage == index
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
          itemCount: orderState.ordperProcessList.length,
          onPageChanged: (int page) {
            ref.read(orderProvider.notifier).updatePage(page);
          },
          itemBuilder: (context, index) {
            return orderprocssingWidget[index];
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: CheckoutCard(
            onPressBtn: () {
              if (orderState.activePage != 3) {
                _onCategoryTap(orderState.activePage + 1);
              } else {
                Utils.toastMessage('Thanks for shopping');
              }
            },
            title: orderState.activePage == 3 ? 'Checkout' : 'Proceed',
          ),
        ),
      ),
    );
  }
}

List<Widget> orderprocssingWidget = [
  const CartListview(),
  const Center(child: DeliveryOptionWidget()),
  const Center(child: AddressCardview()),
  const Center(child: PaymentCheckoutView()),
];
