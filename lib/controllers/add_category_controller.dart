import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:spend_app/models/category_model.dart';
import 'package:spend_app/providers/category_provider.dart';

class AddCategoryController extends GetxController {
  late String inputCategory = "";
  List<CategoryModel> listCategory = [];

  @override
  void onInit() async {
    super.onInit();

    listCategory = await CategoryProvider.instance.read();

    if (listCategory.isNotEmpty) {
      update();
    }
  }

  Future addCategory() async {
    if (inputCategory.trim() != "") {
      listCategory
          .add(CategoryModel(id: listCategory.length + 1, name: inputCategory));
      await CategoryProvider.instance.save(listCategory);
      update();
    }
  }

  void cancelCategory() async {
    inputCategory = "";
  }
}
