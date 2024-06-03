import 'dart:convert';

import 'package:dokan/app/core/utils.dart';
import 'package:dokan/app/module/home/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  var isLoading = false.obs;
  var productList = <ProductModel>[].obs;
  var selectedFilters = <String>[].obs;

  List<String> filterList = [
    "Newest",
    "Oldest",
    "Price low > High",
    "Price high > Low",
    "Best Selling",
  ];

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void selectFilter(String value){
    if(isSelect(value).value){
      selectedFilters.remove(value);
    }else {
      selectedFilters.add(value);
    }
  }

  RxBool isSelect(String value){
    return selectedFilters.any((e) => e == value).obs;
  }

  bool isShowCuttedPrice(index){
    return productList[index].price != productList[index].regularPrice;
  }

  Future<void> getProducts() async {
    try{
      isLoading(true);
      String result =
      await rootBundle.loadString("assets/json/data.json");
      var data = json.decode(result);
      productList.value = List<ProductModel>.from(data.map((x)
      => ProductModel.fromJson(x))).toList();
    } catch (e){
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isLoading(false);
    }
    // data.forEach((key, value) {
    //   currencyList.add(CurrencyModel.fromJson(value));
    // });
  }
}