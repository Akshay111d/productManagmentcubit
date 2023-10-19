import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../repository/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;
  ProductCubit(this._productRepository) : super(ProductInitialState());
  Future<void> fetchAllProducts() async {
    emit(ProductLoadingState());
    try {
      final response = await _productRepository.getProducts();
      emit(ProductLoadedState(response));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }
}
