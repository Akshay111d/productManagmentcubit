// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductVariantAdapter extends TypeAdapter<ProductVariant> {
  @override
  final int typeId = 1;

  @override
  ProductVariant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductVariant(
      productId: fields[0] as int,
      variantType: fields[1] as String,
      variantValue: fields[2] as String,
      tenantId: fields[3] as int,
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ProductVariant obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.variantType)
      ..writeByte(2)
      ..write(obj.variantValue)
      ..writeByte(3)
      ..write(obj.tenantId)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductVariantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
