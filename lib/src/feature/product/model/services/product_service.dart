import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gemicates_machine_task/src/config/strings.dart';
import 'package:gemicates_machine_task/src/feature/product/model/product_model.dart';

class ProductService {
  Future<List<ProductModel>> fetchAllProducts({int skipUpto = 0}) async {
    List<ProductModel> products = [];

    try {
      var response = await Dio().get('$baseUrl/mens-watches?limit=10&skip=$skipUpto');
      log('Response Statuscode: ${response.statusCode}');
      if (response.statusCode == 200) {
        List jsonProducts = response.data['products'];
        int totalProducts = response.data['total'];
        for (int i = 0; i < jsonProducts.length; i++) {
          ProductModel productMo = ProductModel.fromJson(jsonProducts[i]);
          productMo.totalProducts = totalProducts;
          // Calcuating Discounted Price
          double discountedPrice = (productMo.price -
              (productMo.price * (productMo.discountPrecentage / 100)));
          productMo.discountedPrice =
              double.parse(discountedPrice.toStringAsFixed(2));

          products.add(productMo);
        }
        log('Products length from data source: ${products.length}');
      }
    } catch (e) {
      log('Fetch Products Error: $e');
    }
    return products;
  }
}
