class Product {
  int id;
  String name;
  String category;
  String image;
  String descriptiom;
  double price;
  bool isliked;
  bool isSelected;
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.isliked,
    required this.descriptiom,
    this.isSelected = false,
    required this.image,
  });
}
