class OrderProcessing {
  final String processTile;
  final String processIcon;
  final bool isSelected;

  OrderProcessing({
    required this.processTile,
    required this.processIcon,
    required this.isSelected,
  });

  OrderProcessing copyWith(
    String? processTile,
    String? processIcon,
    bool? isSelected,
  ) {
    return OrderProcessing(
      processTile: processTile ?? this.processTile,
      processIcon: processIcon ?? this.processIcon,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
