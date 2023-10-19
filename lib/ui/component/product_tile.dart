import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../constants/constants.dart';
import '../../hive/box.dart';
import '../../hive/cart.dart';
import '../../model/product_model.dart';
import '../../utils/utils.dart';

class ProductTile extends StatelessWidget {
  ProductTile({super.key, required this.product});
  final ProductList product;
  void decreaseQuantityForProduct(int productId) {
    final cartItem = box.values.firstWhere(
      (item) => item.id == productId,
      orElse: () => Cart(id: productId, quantity: 0),
    );

    if (cartItem != null) {
      if (cartItem.quantity > 1) {
        cartItem.quantity = cartItem.quantity - 1;
        cartItem.save();
      } else {
        if (cartItem.name == null) {
          return;
        }
        // If the quantity is 1 or less, you may want to remove the item from the cart
        cartItem.delete();
      }
    }
  }

  addToCart(Cart cart) async {
    for (var item in box.values) {
      if (item.id == cart.id) {
        item.quantity = item.quantity + 1;
        item.save();
        return;
      }
    }
    await box.add(cart);
  }

  int getQuantityForProduct(int productId) {
    final cartItem = box.values.firstWhere(
      (item) => item.id == productId,
      orElse: () => Cart(id: productId, quantity: 0),
    );

    return cartItem != null ? cartItem.quantity : 0;
  }

  List _selecteCategorys = [];
  void _onCategorySelected(bool? selected, category_id) {
    if (selected == true) {
      _selecteCategorys.add(category_id);
    } else {
      _selecteCategorys.remove(category_id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          lightShadow,
          darkShadow,
        ],
        color: const Color(bgColor),
        borderRadius: BorderRadius.circular(radius12),
      ),
      child: ListTile(
        title: Text('${product.name}'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text('${product.unitprice}'),
                    Text(
                      '${product.sp}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                if (product.productVariants != null &&
                    product.productVariants!.isNotEmpty)
                  SizedBox(
                    height: 20,
                    width: 50,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: product.productVariants?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Text(
                              "${product.productVariants?[index].variantValue}");
                        }),
                  )
              ],
            ),
            Row(
              children: [
                IconButton.outlined(
                    color: Colors.green,
                    onPressed: () {
                      final data = Cart(
                          name: "${product.name}",
                          sp: product.sp!,
                          id: product.id!,
                          price: int.parse("${product.unitprice}"),
                          quantity: 1,
                          productVariant: product.productVariants);
                      addToCart(data);
                    },
                    icon: const Icon(
                      Icons.add,
                    )),
                ValueListenableBuilder(
                  valueListenable: box.listenable(),
                  builder: (BuildContext context, value, Widget? child) {
                    return Text(getQuantityForProduct(product.id!).toString());
                  },
                ),
                IconButton.outlined(
                    color: Colors.red,
                    onPressed: () {
                      decreaseQuantityForProduct(product.id!);
                    },
                    icon: const Icon(
                      Icons.remove,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
