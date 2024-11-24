import 'package:ecommerce_app/models/app_data.dart';
import 'package:ecommerce_app/models/order_processing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderProvider = StateNotifierProvider<OrderProvider, OrderState>(
  (ref) => OrderProvider(),
);

class OrderState {
  final int activePage;
  final List<OrderProcessing> ordperProcessList;

  OrderState({
    required this.activePage,
    required this.ordperProcessList,
  });

  OrderState copyWith({
    int? activePage,
    List<OrderProcessing>? ordperProcessList,
  }) {
    return OrderState(
      activePage: activePage ?? this.activePage,
      ordperProcessList: ordperProcessList ?? this.ordperProcessList,
    );
  }
}

class OrderProvider extends StateNotifier<OrderState> {
  OrderProvider()
      : super(OrderState(
          activePage: 0,
          ordperProcessList: rowItems,
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

  void updatePage(int index) {
    state = state.copyWith(activePage: index);
  }
}
