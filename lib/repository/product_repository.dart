import 'dart:convert';

import 'package:productmanagment/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:productmanagment/model/product_model.dart';

class ProductRepository {
  Future<List<ProductList>> getProducts() async {
    final uri = Uri.parse(baseUrl);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = response.body;
      final products = (json.decode(jsonData)['product_list'] as List)
          .map((item) => ProductList.fromJson(item))
          .toList();
      return products;
    } else {
      throw 'Something went wrong!${response.statusCode}';
    }
  }
}
