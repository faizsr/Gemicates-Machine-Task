import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:gemicates_machine_task/src/feature/product/model/product_model.dart';
import 'package:gemicates_machine_task/src/feature/product/model/services/product_service.dart';
import 'package:gemicates_machine_task/src/feature/product/model/services/remote_config_service.dart';

class ProductController extends ChangeNotifier {
  final ProductService productService = ProductService();
  final RemoteConfigService remoteConfigService = RemoteConfigService();

  List<ProductModel> products = [];
  bool isLoading = false;
  bool discountStatus = false;
  int skipUpto = 0;
  int totalProducts = 0;

  fetchAllProducts({bool onRefresh = false}) async {
    if (onRefresh) {
      isLoading = true;
      notifyListeners();
      products = await productService.fetchAllProducts();
      notifyListeners();
    } else {
      skipUpto += 10;
      totalProducts = products[products.length - 1].totalProducts;
      if (products.length < totalProducts) {
        products
            .addAll(await productService.fetchAllProducts(skipUpto: skipUpto));
      }
      notifyListeners();
    }
    discountStatus = await remoteConfigService.discountStatus();
    log('Products length from controller: ${products.length}');
    log('Discount status from controller: $discountStatus');
    notifyListeners();

    isLoading = false;
    notifyListeners();
    return [products.length, totalProducts];
  }
}
