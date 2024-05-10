import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spend_app/constants.dart';
import 'package:spend_app/controllers/day_now_controller.dart';
import 'package:spend_app/controllers/home_controller.dart';
import 'package:spend_app/screen/pages/day_show_screen.dart';
import 'package:spend_app/screen/pages/last_day_screen.dart';
import 'package:spend_app/screen/product/add_category_screen.dart';
import 'package:spend_app/style/style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_controller) => Scaffold(
        floatingActionButton: _controller.isDayNow
            ? SizedBox(
                height: 50,
                width: 50,
                child: TextButton(
                  onPressed: () async {
                    Get.defaultDialog(
                        contentPadding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 10),
                        title: "Thêm sản phẩm",
                        onConfirm: () async {
                          await _controller.addProduct();
                          Get.back();
                        },
                        onCancel: () {
                          _controller.cancelProduct();
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
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "ID: ${DayShowController.getNumberNew()}",
                                    style: const TextStyle(
                                        color: Colors.blueGrey, fontSize: 13),
                                  ),
                                )
                              ],
                            ),
                            TextField(
                              onChanged: (value) {
                                _controller.name = value;
                              },
                              decoration: const InputDecoration(
                                  labelText: "Tên sản phẩm"),
                            ),
                            TextField(
                              onChanged: (value) {
                                _controller.money = value;
                              },
                              decoration: const InputDecoration(
                                  labelText: "Giá tiền",
                                  suffixText: ".000 VND"),
                            ),
                            const SizedBox(height: 10),
                            const Text("Loại sản phẩm"),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  Get.bottomSheet(Container(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    height: Get.height / 2,
                                    width: double.infinity,
                                    child: ListView.builder(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      itemBuilder: (cxt, i) =>
                                          _ItemCategory(_controller, i),
                                      itemCount:
                                          _controller.listCategory!.length,
                                    ),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                  ));
                                },
                                child: Text(_controller.getNameCategory()),
                              ),
                            ),
                            GetBuilder<HomeController>(
                                init: _controller,
                                builder: (_c) => GestureDetector(
                                      onTap: () {
                                        _c.dataSearch = !_c.dataSearch;
                                        _c.update();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Checkbox(
                                            value: _controller.dataSearch,
                                            onChanged: (value) {
                                              _c.dataSearch = value!;
                                              _c.update();
                                            },
                                          ),
                                          Text("dữ liệu tìm kiếm?")
                                        ],
                                      ),
                                    ))
                          ],
                        ));
                  },
                  child: const Icon(
                    Icons.post_add_rounded,
                    color: Colors.white,
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF3167FB),
                      shape: const StadiumBorder()),
                ),
              )
            : null,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding / 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Tháng hiện tại", style: textDetailStyle),
                                const SizedBox(height: defaultPadding / 4),
                                Text(
                                  "Chi tiêu của tháng 12",
                                  style: textSubStyle.copyWith(fontSize: 13),
                                )
                              ],
                            ),
                            Text("100.000 VND", style: textCoinStyle),
                          ],
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _ButtonHeader(
                          text: "Sản phẩm",
                          onTap: () {},
                        ),
                        _ButtonHeader(
                          color: const Color(0xFFF4511E),
                          icon: Icons.subject_rounded,
                          text: "Danh mục",
                          onTap: () {
                            Get.to(const AddCategoryScreen());
                          },
                        ),
                        _ButtonHeader(
                          color: const Color(0xFFD81B60),
                          icon: Icons.pie_chart_rounded,
                          text: "Thống kê",
                          onTap: () {},
                        ),
                        _ButtonOtherHeader(
                          text: "Khác",
                          onTap: () {},
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 12,
                  child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 200,
                                  child: TabBar(
                                      controller: _controller.tabController,
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                      tabs: [
                                        Text(
                                          "Hôm qua",
                                          style: textCoinStyle.copyWith(
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "Hôm nay",
                                          style: textCoinStyle.copyWith(
                                              fontSize: 14),
                                        )
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    _controller.isDayNow
                                        ? _controller.dateNow
                                        : _controller.lastDate,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 9,
                              child: TabBarView(
                                controller: _controller.tabController,
                                children: [
                                  LastDayScreen(
                                    _controller,
                                  ),
                                  DayNowScreen(_controller)
                                ],
                              ))
                        ],
                      ),
                      decoration: boxDecoration))
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemCategory extends StatelessWidget {
  const _ItemCategory(
    this.controller,
    this.index, {
    Key? key,
  }) : super(key: key);
  final HomeController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          controller.changeChooseCategory(controller.listCategory![index].id);
          Get.back();
        },
        child: ListTile(
          leading: SizedBox(
            width: 35,
            child: Center(
              child: Text(
                "#${controller.listCategory![index].id}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          title: Text(
            controller.listCategory![index].name,
          ),
        ),
      ),
    );
  }
}

class _ButtonHeader extends StatelessWidget {
  const _ButtonHeader({
    Key? key,
    this.color,
    required this.text,
    required this.onTap,
    this.icon,
  }) : super(key: key);
  final Color? color;
  final String text;
  final Function onTap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        width: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              child: Icon(
                icon ?? Icons.move_to_inbox_rounded,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: color ?? const Color(0xFF3365F9),
                  borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(
              text,
              style:
                  textSubStyle.copyWith(color: Colors.black.withOpacity(0.7)),
            )
          ],
        ),
      ),
    );
  }
}

class _ButtonOtherHeader extends StatelessWidget {
  const _ButtonOtherHeader({
    Key? key,
    this.color,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final Color? color;
  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        width: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              child: const Icon(
                Icons.more_horiz_rounded,
                color: Color(0xFF3365F9),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: color ?? const Color(0xFF3365F9)),
                  borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(
              text,
              style:
                  textSubStyle.copyWith(color: Colors.black.withOpacity(0.7)),
            )
          ],
        ),
      ),
    );
  }
}
