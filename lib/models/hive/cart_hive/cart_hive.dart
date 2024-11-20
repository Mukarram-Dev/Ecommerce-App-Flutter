import 'package:hive/hive.dart';

part 'cart_hive.g.dart';

@HiveType(typeId: 2)
class AddToCart {
  @HiveField(0)
  int? key;
  @HiveField(1)
  final int? userId;
  @HiveField(2)
  final int? productId;
  @HiveField(3)
  final String? productName;
  @HiveField(4)
  final int? productCount;
  @HiveField(5)
  final double? productPrice;
  @HiveField(6)
  final String? productImage;

  AddToCart({
    this.key,
    required this.userId,
    required this.productId,
    required this.productName,
    required this.productCount,
    required this.productPrice,
    required this.productImage,
  });

  factory AddToCart.fromMap(Map<String, dynamic> items) {
    return AddToCart(
      key: items['key'] as int?,
      userId: items['userId'],
      productId: items['productId'],
      productName: items['productName'],
      productCount: items['productCount'],
      productPrice: items['productPrice'],
      productImage: items['productImage'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'userId': userId,
      'productId': productId,
      'productName': productName,
      'productCount': productCount,
      'productPrice': productPrice,
      'productImage': productImage,
    };
  }
}
