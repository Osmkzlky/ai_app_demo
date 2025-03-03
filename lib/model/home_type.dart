import 'package:ai_app_demo/screen/feature/chatbot_feature.dart';
import 'package:ai_app_demo/screen/feature/image_feature.dart';

import 'package:ai_app_demo/screen/feature/translator_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  String get title => switch (this) {
        HomeType.aiChatBot => "AI ChatBot",
        HomeType.aiImage => "AI Image Creator",
        HomeType.aiTranslator => "Language Translator"
      };

  String get lottie => switch (this) {
        HomeType.aiChatBot => "assets/animation/ai_hand_waving.json",
        HomeType.aiImage => "assets/animation/ai_play.json",
        HomeType.aiTranslator => "assets/animation/ai_ask_me.json"
      };

  bool get letAlign => switch (this) {
        HomeType.aiChatBot => true,
        HomeType.aiImage => false,
        HomeType.aiTranslator => true
      };

  EdgeInsets get padding => switch (this) {
        HomeType.aiChatBot => EdgeInsets.zero,
        HomeType.aiImage => EdgeInsets.all(20),
        HomeType.aiTranslator => EdgeInsets.zero
      };
  VoidCallback get onTap => switch (this) {
        HomeType.aiChatBot => () => Get.to(() => ChatbotFeature()),
        HomeType.aiImage => () => Get.to(() => ImageFeature()),
        HomeType.aiTranslator => () => Get.to(() => TranslatorFeature()),
      };
}
