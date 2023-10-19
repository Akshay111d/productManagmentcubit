import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:productmanagment/constants/constants.dart';
import 'package:productmanagment/cubit/product_cubit.dart';
import 'package:productmanagment/hive/cart.dart';
import 'package:productmanagment/main.dart';
import 'package:productmanagment/ui/screens/cart_screen.dart';
import 'package:productmanagment/utils/utils.dart';

import '../../hive/box.dart';
import '../../model/product_model.dart';
import '../component/product_tile.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<ProductCubit>();
      cubit.fetchAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => CartScreen()));
                  },
                  icon: const Icon(Icons.shopping_cart)),
              Positioned(
                  child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (BuildContext context, value, Widget? child) {
                  return Text(box.length.toString());
                },
              ))
            ],
          )
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductInitialState || state is ProductLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoadedState) {
            final products = state.products;
            return ListView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  final product = products[index];

                  return ProductTile(
                    product: ProductList(
                      name: product.name,
                      unitprice: product.unitprice.toString(),
                      sp: product.sp,
                      id: product.id,
                    ),
                  );
                });
          } else if (state is ProductErrorState) {
            return Center(child: Text(state.message));
          }
          return Text(state.toString());
        },
      ),
    );
  }
}
