import 'dart:convert';

import 'package:dokan/app/core/utils.dart';
import 'package:dokan/app/module/home/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var mainProductList = <ProductModel>[].obs;
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

  void selectFilter(String value) {
    if (isSelect(value).value) {
      selectedFilters.clear();
    } else {
      selectedFilters.clear();
      selectedFilters.add(value);
    }
  }

  RxBool isSelect(String value) {
    return selectedFilters.any((e) => e == value).obs;
  }

  bool isShowCuttedPrice(index) {
    return productList[index].regularPrice != productList[index].salePrice;
  }

  Future<void> getProducts() async {
    try {
      isLoading(true);
      String result = await rootBundle.loadString("assets/json/data.json");
      var data = json.decode(result);
      productList.value =
          List<ProductModel>.from(data.map((x) => ProductModel.fromJson(x)))
              .toList();
      mainProductList(productList);
    } catch (e) {
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

  void filterApply() {
    if (selectedFilters.isEmpty) {
      if (kDebugMode) {
        print("Apply Full List");
      }
      productList(mainProductList);
    } else {
      if (kDebugMode) {
        print(selectedFilters.first);
      }
      switch (selectedFilters.first) {
        case "Newest":
          productList.sort((a, b) => b.dateCreated.compareTo(a.dateCreated),);
          return;
        case "Oldest":
          productList.sort((a, b) => a.dateCreated.compareTo(b.dateCreated),);
          return;
        case "Price low > High":
          productList.sort((a, b) => Utils.toDouble(a.salePrice).compareTo(Utils.toDouble(b.salePrice)),);
          return;
        case "Price high > Low":
          productList.sort((a, b) => Utils.toDouble(b.salePrice).compareTo(Utils.toDouble(a.salePrice)),);
          return;
        case "Best Selling":
          productList.sort((a, b) => b.totalSales.compareTo(a.totalSales),);
          return;
      }
    }
  }
}
