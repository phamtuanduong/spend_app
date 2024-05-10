import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spend_app/controllers/day_now_controller.dart';
import 'package:spend_app/models/category_model.dart';
import 'package:spend_app/models/product_model.dart';
import 'package:spend_app/providers/category_provider.dart';
import 'package:spend_app/providers/product_provider.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  bool isDayNow = true;

  late String dateNow;
  late String lastDate;

  late String name;
  late String money;
  late int idCategory;
  bool dataSearch = false;

  List<CategoryModel>? listCategory = [];

  @override
  void onInit() async {
    super.onInit();

    DateTime dateTime = DateTime.now();
    dateNow = DateFormat('dd/MM/yyyy').format(dateTime);
    lastDate = DateFormat('dd/MM/yyyy')
        .format(DateTime(dateTime.year, dateTime.month, dateTime.day - 1));

    tabController = TabController(initialIndex: 1, length: 2, vsync: this)
      ..addListener(() {
        isDayNow = !isDayNow;
        update();
      });

    await readCategory();
    update();
  }

  Future<bool> readCategory() async {
    listCategory = await CategoryProvider.instance.read();
    if (listCategory!.isNotEmpty) {
      idCategory = listCategory!.first.id;
    }
    return listCategory!.isNotEmpty;
  }

  String getNameCategory() {
    if (listCategory != null) {
      return listCategory!
          .where((element) => element.id == idCategory)
          .first
          .name;
    }
    return "";
  }

  void changeChooseCategory(int id) {
    idCategory = id;
    update();
  }

  Future addProduct() async {
    if (dataSearch) {
      await ProductProvider.instance.saveDataSearch(name, money);
    }

    List<ProductModel> list =
        await DayShowController.instance.addProduct(name, money);

    await ProductProvider.instance.save(list, dateNow.replaceAll('/', '-'));
  }

  void cancelProduct() {
    name = "";
    money = "";
    dataSearch = false;
  }
}
