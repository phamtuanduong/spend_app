import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:spend_app/models/category_model.dart';

class CategoryProvider {
  CategoryProvider._privateConstructor();

  static final CategoryProvider _instance =
      CategoryProvider._privateConstructor();

  static CategoryProvider get instance => _instance;

  int length = 1;

  List<CategoryModel>? listCategory;

  Future<String> getFilePath() async {
    Directory? appDocumentsDirectory = await getExternalStorageDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory!.path; // 2
    String filePath = '$appDocumentsPath/category_data.json'; // 3
    // print(appDocumentsDirectory);
    return filePath;
  }

  Future save(List<CategoryModel> list) async {
    File file = File(await getFilePath()); // 1
    // file.writeAsString(
    //     "This is my demo text that will be saved to : demoTextFile.txt"); // 2
    if (list.isNotEmpty) {
      listCategory = list;
      String jsonData = json.encode(list);
      file.writeAsStringSync(jsonData);
    }
  }

  Future<List<CategoryModel>> read() async {
    if (listCategory != null) {
      return listCategory!;
    }

    File file = File(await getFilePath()); // 1
    bool exists = await file.exists();
    List<CategoryModel> listCate = [];
    if (exists) {
      String fileContent = await file.readAsString(); // 2
      List<dynamic> list = json.decode(fileContent);
      if (list.isNotEmpty) {
        listCate = list.map((e) => CategoryModel.fromJson(e)).toList();
        return listCate;
      }
    }
    listCategory = listCate;
    return listCate;
    //print('File Content: $fileContent');
  }
}
