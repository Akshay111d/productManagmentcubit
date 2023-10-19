import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:productmanagment/model/product_model.dart';
import 'package:productmanagment/ui/component/product_tile.dart';

import '../../constants/constants.dart';
import '../../hive/box.dart';
import '../../hive/cart.dart';
import '../../utils/utils.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  int calculateTotalQuantity() {
    int totalQuantity = 0;
    for (var item in box.values) {
      totalQuantity += item.quantity;
    }
    return totalQuantity;
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in box.values) {
      total += item.quantity * item.price!.toDouble();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, box1, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: box1.length,
                    itemBuilder: (ctx, index) {
                      final data = box1.getAt(index);
                      return ProductTile(
                          product: ProductList(
                              name: data?.name,
                              unitprice: data?.price.toString(),
                              sp: data?.sp,
                              id: data?.id,
                              productVariants: data?.productVariant));
                    }),
              ),
              Container(
                padding: EdgeInsets.all(padding16),
                decoration: BoxDecoration(
                  boxShadow: [
                    lightShadow,
                    darkShadow,
                  ],
                  color: const Color(bgColor),
                  borderRadius: BorderRadius.circular(radius12),
                ),
                child: Column(
                  children: [
                    Text(
                      'Total Items ${box1.length}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Total quantity ${calculateTotalQuantity()}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Total Price ${calculateTotalPrice().toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
