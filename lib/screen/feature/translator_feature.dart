import 'package:ai_app_demo/controller/imageAIController.dart';
import 'package:ai_app_demo/controller/translatorController.dart';
import 'package:ai_app_demo/helpers/size.dart';
import 'package:ai_app_demo/widgets/custom_btn.dart';
import 'package:ai_app_demo/widgets/custom_loading.dart';
import 'package:ai_app_demo/widgets/language_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslatorFeature extends StatelessWidget {
  final controller = Get.put(TranslatorController());
  TranslatorFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi Language Translator")),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 15.h),
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => Get.bottomSheet(LanguageSheet(
                controller: controller,
                s: controller.from,
              )),
              child: Container(
                  alignment: Alignment.center,
                  height: 5.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)),
                  child: Obx(() => Text(
                        controller.from.isEmpty
                            ? "Auto"
                            : controller.from.value,
                        style: TextStyle(fontSize: 18.sp),
                      ))),
            ),
            IconButton(
                onPressed: controller.swapLanguages,
                icon: Obx(
                  () => Icon(
                    CupertinoIcons.repeat,
                    color:
                        controller.to.isNotEmpty && controller.from.isNotEmpty
                            ? Colors.blue
                            : Colors.grey,
                  ),
                )),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => Get.bottomSheet(LanguageSheet(
                controller: controller,
                s: controller.to,
              )),
              child: Container(
                  alignment: Alignment.center,
                  height: 5.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)),
                  child: Obx(() => Text(
                        controller.to.isEmpty ? "To" : controller.to.value,
                        style: TextStyle(fontSize: 18.sp),
                      ))),
            )
          ]),
          SizedBox(height: 3.h),
          TextFormField(
            minLines: 5,
            maxLines: null,
            controller: controller.inputController,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Translator anything you want...",
                hintStyle: TextStyle(fontSize: 15.sp),
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(height: 3.h),
          if (controller.outputController.text.isNotEmpty)
            Obx(() => _translateResult()),
          SizedBox(height: 3.h),
          CustomBtn(onPress: controller.translate, text: "Translate")
        ],
      ),
    );
  }

  Widget _translateResult() => switch (controller.status.value) {
        Status.none => const SizedBox(),
        Status.complete => TextFormField(
            controller: controller.outputController,
            maxLines: null,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
        Status.loading => const Align(child: CustomLoading())
      };
}
