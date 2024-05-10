import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spend_app/controllers/home_controller.dart';
import 'package:spend_app/controllers/last_day_controller.dart';
import 'package:spend_app/style/style.dart';

class LastDayScreen extends StatelessWidget {
  const LastDayScreen(this.homeController, {Key? key}) : super(key: key);
  final HomeController homeController;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LastDayController>(
      init: LastDayController(),
      builder: (_controller) => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _controller.scrollController,
              itemBuilder: (cxt, i) => const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.auto_stories_rounded),
                  title: Text("sfdsfds"),
                  subtitle: Text("fđgfdg"),
                  trailing: Text("100.000 VND")),
              itemCount: 100,
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
