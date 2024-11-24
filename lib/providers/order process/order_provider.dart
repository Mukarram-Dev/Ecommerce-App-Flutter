import 'package:ecommerce_app/models/app_data.dart';
import 'package:ecommerce_app/models/order_processing.dart';
import 'package:ecommerce_app/models/payment_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderProvider = StateNotifierProvider<OrderProvider, OrderState>(
  (ref) => OrderProvider(),
);

class OrderState {
  final int activePage;
  final List<OrderProcessing> ordperProcessList;
  final List<PaymentMethod> paymentMethodList;

  OrderState({
    required this.activePage,
    required this.ordperProcessList,
    required this.paymentMethodList,
  });

  OrderState copyWith({
    int? activePage,
    List<OrderProcessing>? ordperProcessList,
    List<PaymentMethod>? paymentMethodList,
  }) {
    return OrderState(
      activePage: activePage ?? this.activePage,
      ordperProcessList: ordperProcessList ?? this.ordperProcessList,
      paymentMethodList: paymentMethodList ?? this.paymentMethodList,
    );
  }
}

class OrderProvider extends StateNotifier<OrderState> {
  OrderProvider()
      : super(OrderState(
          activePage: 0,
          ordperProcessList: rowItems,
          paymentMethodList: paymentMethod,
        ));

  void updateRow(int index, bool val) {
    final list = state.ordperProcessList;
    for (int i = 0; i < list.length; i++) {
      list[index].copyWith(
        isSelected: val,
      );
    }
    state = state.copyWith(ordperProcessList: list);
  }

  void updatePayment(int index, String val) {
    final list = List<PaymentMethod>.from(
        state.paymentMethodList); // Create a mutable copy
    for (int i = 0; i < list.length; i++) {
      list[i] = list[i].copyWith(isSelected: i == index);
    }
    state = state.copyWith(paymentMethodList: list);
  }

  void updatePage(int index) {
    state = state.copyWith(activePage: index);
  }
}
