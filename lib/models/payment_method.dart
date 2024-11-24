class PaymentMethod {
  String paymentTitle;
  String icon;
  bool isSelected;

  PaymentMethod(this.paymentTitle, this.icon, this.isSelected);

  PaymentMethod copyWith({
    String? paymentTitle,
    String? icon,
    bool? isSelected,
  }) {
    return PaymentMethod(
      paymentTitle ?? this.paymentTitle,
      icon ?? this.icon,
      isSelected ?? this.isSelected,
    );
  }
}
