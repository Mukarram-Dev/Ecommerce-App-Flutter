class Product {
  int id;
  String name;
  String category;
  String image;
  double price;
  bool isliked;
  bool isSelected;
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.isliked,
    this.isSelected = false,
    required this.image,
  });
}
