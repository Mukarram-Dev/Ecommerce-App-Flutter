// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddToCartAdapter extends TypeAdapter<AddToCart> {
  @override
  final int typeId = 2;

  @override
  AddToCart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddToCart(
      key: fields[0] as int?,
      userId: fields[1] as int?,
      productId: fields[2] as int?,
      productName: fields[3] as String?,
      productCount: fields[4] as int?,
      productPrice: fields[5] as double?,
      productImage: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AddToCart obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.productId)
      ..writeByte(3)
      ..write(obj.productName)
      ..writeByte(4)
      ..write(obj.productCount)
      ..writeByte(5)
      ..write(obj.productPrice)
      ..writeByte(6)
      ..write(obj.productImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddToCartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
