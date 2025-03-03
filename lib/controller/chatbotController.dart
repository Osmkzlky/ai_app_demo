import 'package:ai_app_demo/apis/apis.dart';
import 'package:ai_app_demo/helpers/myDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/message.dart';

class ChatbotController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();

  RxList list = <Message>[
    Message(msg: "Hello, How can I help you?", msgType: MessageType.bot)
  ].obs;

  Future<void> askQuestion() async {
    if (textEditingController.text.trim().isNotEmpty) {
      list.add(
          Message(msg: textEditingController.text, msgType: MessageType.user));
      list.add(Message(msg: "", msgType: MessageType.bot));
      scrollDown();

      final res = await APIs.getAnswer(textEditingController.text);

      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));
      textEditingController.text = "";
      scrollDown();
    } else {
      MyDialog.info("Ask Something!");
    }
  }

  void scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
}
