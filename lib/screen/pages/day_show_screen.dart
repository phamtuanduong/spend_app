import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spend_app/controllers/day_now_controller.dart';
import 'package:spend_app/controllers/home_controller.dart';
import 'package:spend_app/style/style.dart';

class DayNowScreen extends StatelessWidget {
  const DayNowScreen(this.homeController, {Key? key}) : super(key: key);
  final HomeController homeController;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DayShowController>(
      init: DayShowController(),
      builder: (_controller) => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _controller.scrollController,
              itemBuilder: (cxt, i) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.auto_stories_rounded),
                  title: Text(_controller.listProduct[i].name),
                  subtitle:
                      Text(_controller.listProduct[i].categoryModel!.name),
                  trailing: Text(_controller.toCoin(i))),
              itemCount: _controller.listProduct.length,
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 7),
                Text(
                  "Tổng chi:",
                  style: textSubStyle.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 5),
                Text(
                  "100.000 VND",
                  style: textCoinStyle.copyWith(color: Colors.red),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
