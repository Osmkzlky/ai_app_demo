import 'package:ai_app_demo/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreenController extends GetxController {
  PageController pageController = PageController();
  RxInt pageIndex = 0.obs;
  void updateIndex(int index) async {
    pageIndex.value = index;
    if (pageIndex.value == 2) {
      Get.to(HomeScreen());
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboarding', true);
      print(prefs);
    }
  }

  void nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
