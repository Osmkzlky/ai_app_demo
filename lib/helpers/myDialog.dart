import 'package:ai_app_demo/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog {
  static void info(String msg) {
    Get.snackbar("İnfo", msg,
        backgroundColor: Colors.blue.withOpacity(.8), colorText: Colors.white);
  }

  static void error(String msg) {
    Get.snackbar("Eror", msg,
        backgroundColor: Colors.red.withOpacity(.8), colorText: Colors.white);
  }

  static void success(String msg) {
    Get.snackbar("Eror", msg,
        backgroundColor: Colors.green.withOpacity(.8), colorText: Colors.white);
  }

  static void showLoadingDiolog() {
    Get.dialog(const Center(child: CustomLoading()));
  }
}
