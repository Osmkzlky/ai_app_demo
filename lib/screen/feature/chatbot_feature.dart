import 'package:ai_app_demo/controller/chatbotController.dart';
import 'package:ai_app_demo/helpers/size.dart';
import 'package:ai_app_demo/widgets/messageCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatbotFeature extends StatelessWidget {
  final controller = Get.put(ChatbotController());
  ChatbotFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat with AI Assistant")),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Obx(() => ListView(
              physics: const BouncingScrollPhysics(),
              controller: controller.scrollController,
              padding: EdgeInsets.fromLTRB(1.w, 1.h, 1.w, 15.h),
              children:
                  controller.list.map((e) => MessageCard(message: e)).toList(),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              controller: controller.textEditingController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Ask me anything you want...",
                  hintStyle: TextStyle(fontSize: 15.sp),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.blue,
                child: IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      controller.askQuestion();
                    },
                    icon: Icon(
                      Icons.rocket_launch,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
