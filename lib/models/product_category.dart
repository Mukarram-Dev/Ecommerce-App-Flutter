class ProductCategory {
  int? id;
  String? name;
  String? image;
  bool? isSelected;

  ProductCategory({
    this.id,
    this.name,
    this.image,
    this.isSelected,
  });

  ProductCategory copyWith({
    int? id,
    String? name,
    String? image,
    bool? isSelected,
  }) {
    return ProductCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
