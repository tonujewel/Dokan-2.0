import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/product_model.dart';

abstract class ProductDataSrc {
  Future<List<ProductModel>> getProducts();
}

class ProductDataSrcImpl implements ProductDataSrc {
  @override
  Future<List<ProductModel>> getProducts() async {
    final String response = await rootBundle.loadString('assets/json/response.json');
    final data = await json.decode(response); // TODO:: need to parse data
    return [];
  }
}
