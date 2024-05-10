import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LastDayController extends GetxController {
  late ScrollController scrollController;
  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
