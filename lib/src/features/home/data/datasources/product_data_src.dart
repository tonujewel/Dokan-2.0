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
    List<ProductModel> result = List<ProductModel>.from(json.decode(response).map((x) => ProductModel.fromJson(x)));

    return result;
  }
}
