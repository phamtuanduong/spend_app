import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spend_app/models/product_model.dart';

class DayShowController extends GetxController {
  late ScrollController scrollController;

  late String dateNow;
  List<ProductModel> listProduct = [];
  static List<ProductModel> getProductList = [];

  static late DayShowController instance;

  static String getNumberNew() =>
      NumberFormat('#00').format((getProductList.length + 1)).toString();
  @override
  void onInit() {
    super.onInit();
    instance = this;
    scrollController = ScrollController();

    dateNow = DateFormat('ddMMyyyy').format(DateTime.now());

    getProductList = listProduct;
  }

  Future<List<ProductModel>> addProduct(String key, String money) async {
    listProduct.add(ProductModel(
        id: listProduct.length + 1, name: key, money: double.parse(money)));
    update();
    return listProduct;
  }

  String toCoin(int i) {
    return "${NumberFormat('###.#', listProduct[i].money.toString())} VND";
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
