// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ai_app_demo/controller/translatorController.dart';
import 'package:ai_app_demo/helpers/size.dart';

class LanguageSheet extends StatelessWidget {
  final TranslatorController controller;
  final RxString s;
  LanguageSheet({
    Key? key,
    required this.controller,
    required this.s,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final search = "".obs;
    return Container(
        height: 50.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h, bottom: 1.h),
              child: TextFormField(
                onChanged: (value) => search.value = value.toLowerCase(),

                maxLines: null,
                //controller: controller.outputController,
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.translate_rounded,
                          color: Colors.blue,
                        )),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search Language...",
                    hintStyle: TextStyle(fontSize: 15.sp),
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Expanded(child: Obx(() {
              List<String> list = search.isEmpty
                  ? controller.lang
                  : controller.lang
                      .where((e) => e.toLowerCase().contains(search.value))
                      .toList();
              return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        s.value = list[index];
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Text(list[index]),
                      ),
                    );
                  });
            })),
          ],
        ));
  }
}
