import 'package:hive/hive.dart';

import '../model/product_model.dart';

part 'cart.g.dart';

@HiveType(typeId: 1)
class Cart extends HiveObject {
  Cart(
      {this.name,
      this.sp,
      this.price,
      this.id,
      required this.quantity,
      this.productVariant});
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? price;
  @HiveField(2)
  int? sp;
  @HiveField(3)
  int? id;
  @HiveField(4)
  int quantity = 0;
  @HiveField(5)
  List<ProductVariant>? productVariant;
}
