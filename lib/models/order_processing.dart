class OrderProcessing {
  String processTile;
  String processIcon;
  bool isSelected;

  OrderProcessing(
    this.processTile,
    this.processIcon,
    this.isSelected,
  );

  OrderProcessing copyWith({
    String? processTile,
    String? processIcon,
    bool? isSelected,
  }) {
    return OrderProcessing(
      processTile ?? this.processTile,
      processIcon ?? this.processIcon,
      isSelected ?? this.isSelected,
    );
  }
}
