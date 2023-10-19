import 'package:hive/hive.dart';

part 'product_variant.g.dart'; // You'll need to generate this file

@HiveType(typeId: 1)
class ProductVariant {
  @HiveField(0)
  int productId;

  @HiveField(1)
  String variantType;

  @HiveField(2)
  String variantValue;

  @HiveField(3)
  int tenantId;

  @HiveField(4)
  DateTime createdAt;

  ProductVariant({
    required this.productId,
    required this.variantType,
    required this.variantValue,
    required this.tenantId,
    required this.createdAt,
  });
}
