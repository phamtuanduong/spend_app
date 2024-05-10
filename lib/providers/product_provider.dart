import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:spend_app/models/data_search_model.dart';
import 'package:spend_app/models/product_model.dart';

class ProductProvider {
  ProductProvider._privateConstructor();

  static final ProductProvider _instance =
      ProductProvider._privateConstructor();

  static ProductProvider get instance => _instance;

  List<ProductModel>? listCategoryNow;

  List<ProductModel>? listCategoryLast;

  List<DataSearchModel>? listDataSearch;

  Future<String> getFilePath(String fileName) async {
    Directory? appDocumentsDirectory = await getExternalStorageDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory!.path; // 2
    String filePath = '$appDocumentsPath/$fileName.json'; // 3
    // print(appDocumentsDirectory);
    return filePath;
  }

  Future<String> _getFileDataSearchPath() async {
    Directory? appDocumentsDirectory = await getExternalStorageDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory!.path; // 2
    String filePath = '$appDocumentsPath/data_search.json'; // 3
    // print(appDocumentsDirectory);
    return filePath;
  }

  Future save(List<ProductModel> list, String fileName) async {
    File file = File(await getFilePath(fileName)); // 1
    // file.writeAsString(
    //     "This is my demo text that will be saved to : demoTextFile.txt"); // 2
    if (list.isNotEmpty) {
      listCategoryNow = list;
      String jsonData = json.encode(list);
      file.writeAsStringSync(jsonData);
    }
  }

  Future saveDataSearch(String key, String value) async {
    File file = File(await _getFileDataSearchPath());
    if (listDataSearch == null) {
      await readDataSearch(file);
    }

    if (listDataSearch!.isNotEmpty) {
      listDataSearch!.add(DataSearchModel(key: key, value: value));
      String jsonData = json.encode(listDataSearch);
      file.writeAsStringSync(jsonData);
    }
  }

  Future<List<DataSearchModel>> readDataSearch(File? file) async {
    if (listDataSearch != null) {
      return listDataSearch!;
    }
    file ??= File(await _getFileDataSearchPath());
    bool exists = await file.exists();
    List<DataSearchModel> listCate = [];
    if (exists) {
      String fileContent = await file.readAsString(); // 2
      List<dynamic> list = json.decode(fileContent);
      if (list.isNotEmpty) {
        listCate = list.map((e) => DataSearchModel.fromJson(e)).toList();
        return listCate;
      }
    }
    listDataSearch = listCate;
    return listCate;
    //print('File Content: $fileContent');
  }

  Future<List<ProductModel>> read(String fileName, {bool isNow = true}) async {
    if (listCategoryNow != null && isNow) {
      return listCategoryNow!;
    } else if (listCategoryLast != null) {
      return listCategoryLast!;
    }

    File file = File(await getFilePath(fileName)); // 1
    bool exists = await file.exists();
    List<ProductModel> listCate = [];
    if (exists) {
      String fileContent = await file.readAsString(); // 2
      List<dynamic> list = json.decode(fileContent);
      if (list.isNotEmpty) {
        listCate = list.map((e) => ProductModel.fromJson(e)).toList();
        return listCate;
      }
    }
    if (isNow) {
      listCategoryNow = listCate;
    } else {
      listCategoryLast = listCate;
    }
    return listCate;
    //print('File Content: $fileContent');
  }
}
