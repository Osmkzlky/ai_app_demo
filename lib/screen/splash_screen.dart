import 'package:ai_app_demo/helpers/size.dart';
import 'package:ai_app_demo/screen/home_screen.dart';
import 'package:ai_app_demo/screen/onboarding_screen.dart';
import 'package:ai_app_demo/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool onboarding = prefs.getBool('onboarding') ?? false;
      Get.to(onboarding ? HomeScreen() : OnboardingScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(
            flex: 2,
          ),
          SizedBox(
            height: 20.h,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
          ),
          Spacer(),
          CustomLoading(),
          Spacer(),
        ],
      ),
    ));
  }
}
