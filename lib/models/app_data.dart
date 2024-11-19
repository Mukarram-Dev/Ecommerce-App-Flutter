import 'package:ecommerce_app/config/assets/image_assets.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/product_category.dart';
import 'package:ecommerce_app/models/promo_banner.dart';

class AppData {
  static List<Product> productList = [
    Product(
      id: 1,
      name: 'Sneakers Air Max 200',
      price: 240.00,
      isSelected: true,
      isliked: false,
      image: ImageAssets.sneaker1,
      category: "Sneakers",
      descriptiom: dummyText,
    ),
    Product(
      id: 2,
      name: 'Sneakers White Max 97',
      price: 220.00,
      isliked: false,
      image: ImageAssets.sneaker2,
      descriptiom: dummyText,
      category: "Sneakers",
    ),
    Product(
      id: 3,
      name: 'Sneakers Pink',
      price: 220.00,
      isliked: false,
      image: ImageAssets.sneaker3,
      descriptiom: dummyText,
      category: "Sneakers",
    ),
    Product(
      id: 4,
      name: 'Sneakers White Max 91',
      price: 180.00,
      isliked: false,
      image: ImageAssets.sneaker4,
      descriptiom: dummyText,
      category: "Sneakers",
    ),
    Product(
      id: 5,
      name: 'Sneakers Max 90',
      price: 200.00,
      isliked: false,
      image: ImageAssets.sneakers,
      descriptiom: dummyText,
      category: "Sneakers",
    ),
    Product(
      id: 6,
      name: 'Shoes Dark Brown Max 80',
      price: 250.00,
      isliked: false,
      image: ImageAssets.menShoes1,
      descriptiom: dummyText,
      category: "Shoes",
    ),
    Product(
      id: 7,
      name: 'Shoes Camel Max 83',
      price: 270.00,
      isliked: false,
      image: ImageAssets.menShoes2,
      descriptiom: dummyText,
      category: "Shoes",
    ),
    Product(
      id: 8,
      name: 'White Lofer Max 85',
      price: 210.00,
      isliked: false,
      image: ImageAssets.menShoes3,
      descriptiom: dummyText,
      category: "Shoes",
    ),
    Product(
      id: 9,
      name: 'Shoes Brown Max 87',
      price: 220.00,
      isliked: false,
      image: ImageAssets.menShoes4,
      descriptiom: dummyText,
      category: "Shoes",
    ),
    Product(
      id: 10,
      name: 'Jacket Half Sleave',
      price: 300.00,
      isliked: false,
      image: ImageAssets.jacket1,
      descriptiom: dummyText,
      category: "Jacket",
    ),
    Product(
      id: 11,
      name: 'Jacket Yellow Leather',
      price: 350.00,
      isliked: false,
      image: ImageAssets.jacket2,
      descriptiom: dummyText,
      category: "Jacket",
    ),
    Product(
      id: 12,
      name: 'Blue Jeans Jacket',
      price: 360.00,
      isliked: false,
      image: ImageAssets.jacket3,
      descriptiom: dummyText,
      category: "Jacket",
    ),
    Product(
      id: 13,
      name: 'Green Jeans Jacket',
      price: 360.00,
      isliked: false,
      image: ImageAssets.jacket4,
      descriptiom: dummyText,
      category: "Jacket",
    ),
    Product(
      id: 13,
      name: 'Dark Green Wool Jacket',
      price: 390.00,
      isliked: false,
      image: ImageAssets.jacket5,
      descriptiom: dummyText,
      category: "Jacket",
    ),
  ];

  // static List<Product> cartList = [
  //   Product(
  //       id: 1,
  //       name: 'Nike Air Max 200',
  //       price: 240.00,
  //       isSelected: true,
  //       isliked: false,
  //       descriptiom: dummyText,
  //       image: 'assets/small_tilt_shoe_1.png',
  //       category: "Trending Now"),
  //   Product(
  //       id: 2,
  //       name: 'Nike Air Max 97',
  //       price: 190.00,
  //       descriptiom: dummyText,
  //       isliked: false,
  //       image: 'assets/small_tilt_shoe_2.png',
  //       category: "Trending Now"),
  //   Product(
  //       id: 1,
  //       name: 'Nike Air Max 92607',
  //       price: 220.00,
  //       isliked: false,
  //       descriptiom: dummyText,
  //       image: 'assets/small_tilt_shoe_3.png',
  //       category: "Trending Now"),
  //   Product(
  //       id: 2,
  //       name: 'Nike Air Max 200',
  //       price: 240.00,
  //       isSelected: true,
  //       isliked: false,
  //       descriptiom: dummyText,
  //       image: 'assets/small_tilt_shoe_1.png',
  //       category: "Trending Now"),
  //   // Product(
  //   //     id:1,
  //   //     name: 'Nike Air Max 97',
  //   //     price: 190.00,
  //   //     isliked: false,
  //   //     image: 'assets/small_tilt_shoe_2.png',
  //   //     category: "Trending Now"),
  // ];
  static List<ProductCategory> categoryList = [
    ProductCategory(
      id: 1,
      name: "Jackets",
      image: ImageAssets.jacket5,
      isSelected: true,
    ),
    ProductCategory(
      id: 2,
      name: "Shoes",
      image: ImageAssets.menShoes2,
      isSelected: false,
    ),
    ProductCategory(
      id: 3,
      name: "Sneakers",
      image: ImageAssets.sneaker1,
      isSelected: false,
    ),
    ProductCategory(
      id: 4,
      name: "Watches",
      image: ImageAssets.watches,
      isSelected: false,
    ),
    ProductCategory(
      id: 5,
      name: "Shirts",
      image: ImageAssets.shirt3,
      isSelected: false,
    ),
  ];
  static List<PromoBanner> showPromoList = [
    PromoBanner(
      title: 'Get 50% \nDiscount On Your \nSpecial Sale',
      productImage: ImageAssets.jacket4,
    ),
    PromoBanner(
      title: 'Get 40%\nDiscount On Your\nFirst Order',
      productImage: ImageAssets.sneaker1,
    ),
    PromoBanner(
      title: 'Get 40-50%\nDiscount On \nWatches',
      productImage: ImageAssets.watch2,
    ),
  ];
  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
