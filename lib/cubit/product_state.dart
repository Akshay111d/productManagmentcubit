part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductErrorState extends ProductState {
  ProductErrorState(this.message);
  final String message;
}

class ProductLoadedState extends ProductState {
  final List<ProductList> products;
  ProductLoadedState(this.products);
}
