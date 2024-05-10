import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spend_app/components/body_content.dart';
import 'package:spend_app/controllers/add_category_controller.dart';
import 'package:spend_app/style/style.dart';

class AddCategoryScreen extends StatelessWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCategoryController>(
        init: AddCategoryController(),
        builder: (_controller) => BodyContent(
            title: "Danh mục\nsản phẩm!",
            floatButtonBg: const Color(0xFFF4511E),
            floatButtonOnClick: () {
              Get.defaultDialog(
                  title: "Tạo mới",
                  onConfirm: () async {
                    await _controller.addCategory();
                    Get.back();
                  },
                  onCancel: () {
                    _controller.cancelCategory();
                  },
                  cancelTextColor: Colors.blueGrey,
                  confirmTextColor: Colors.white,
                  buttonColor: Colors.blueGrey,
                  textConfirm: "OK",
                  textCancel: "Hủy",
                  radius: 10,
                  content: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "ID: 001",
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 13),
                          )
                        ],
                      ),
                      TextField(
                        onChanged: (value) {
                          _controller.inputCategory = value;
                        },
                        decoration:
                            const InputDecoration(labelText: "Tên danh mục"),
                      )
                    ],
                  ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                  child: Text("Danh sách",
                      style: textCoinStyle.copyWith(fontSize: 14)),
                ),
                Expanded(
                    child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (cxt, i) => _ItemCategory(_controller, i),
                  itemCount: _controller.listCategory.length,
                ))
              ],
            )));
  }
}

class _ItemCategory extends StatelessWidget {
  const _ItemCategory(
    this.controller,
    this.index, {
    Key? key,
  }) : super(key: key);
  final AddCategoryController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        onLongPress: () {},
        child: ListTile(
          leading: SizedBox(
            width: 35,
            child: Center(
              child: Text(
                "#${controller.listCategory[index].id}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          title: Text(
            controller.listCategory[index].name,
          ),
        ),
      ),
    );
  }
}
