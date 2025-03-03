import 'package:ai_app_demo/controller/onboardingScreenController.dart';
import 'package:ai_app_demo/helpers/size.dart';
import 'package:ai_app_demo/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  final controller = Get.put(OnboardingScreenController());
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            SizedBox(
              height: 60.h,
              child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (value) => controller.updateIndex(value),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _buildPageContent(
                          animation: "assets/animation/ai_ask_me.json",
                          title: "Ask me Anything",
                          description:
                              "I can be your best Friend & You can ask me anything & I will help you");
                    } else {
                      return _buildPageContent(
                          animation: "assets/animation/ai_play.json",
                          title: "Ask me Anything",
                          description:
                              "I can be your best Friend & You can ask me anything & I will help you");
                    }
                  }),
            ),
            Wrap(
              children: List.generate(
                  2,
                  (index) => Obx(() => Container(
                        margin: EdgeInsets.symmetric(horizontal: 1.w),
                        width: 10.w,
                        height: 1.2.h,
                        decoration: BoxDecoration(
                            color: controller.pageIndex.value == index
                                ? Colors.blue
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black, offset: Offset(0, 1))
                            ],
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12)),
                      ))),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomBtn(
                      onPress: () {
                        controller.nextPage();
                      },
                      text: "Next")),
            )
          ],
        ),
      ),
    );
  }

  Column _buildPageContent(
      {required String animation,
      required String title,
      required String description}) {
    return Column(
      children: [
        Lottie.asset(animation),
        Text(
          title,
          style: TextStyle(letterSpacing: 5, fontWeight: FontWeight.bold),
        ),
        Text(
          textAlign: TextAlign.center,
          description,
        ),
      ],
    );
  }
}
