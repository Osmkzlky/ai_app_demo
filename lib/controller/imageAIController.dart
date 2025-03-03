import 'dart:developer';
import 'dart:io';

import 'package:ai_app_demo/apis/apis.dart';
import 'package:ai_app_demo/helpers/global.dart';
import 'package:ai_app_demo/helpers/myDialog.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

enum Status { none, loading, complete }

class ImageAiController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  final url = "".obs;
  final status = Status.none.obs;
  final imageList = <String>[].obs;

  Future<void> createAIImage() async {
    OpenAI.apiKey = apiKey;
    if (textEditingController.text.trim().isNotEmpty) {
      status.value = Status.loading;
      try {
        OpenAIImageModel image = await OpenAI.instance.image.create(
          prompt: textEditingController.text,
          n: 1,
          size: OpenAIImageSize.size1024,
          responseFormat: OpenAIImageResponseFormat.url,
        );

        if (image.data.isNotEmpty) {
          url.value = image.data[0].url.toString();
          textEditingController.text = "";
          status.value = Status.complete;
        } else {
          status.value = Status.none;
          MyDialog.error("Could not create image, API response empty.!");
        }
      } catch (e) {
        status.value = Status.none;
        MyDialog.error("OpenAI isteği başarısız oldu: $e");
      }
    } else {
      MyDialog.info("Provider some beautiful description!");
    }
  }

  void downloadImage() async {
    try {
      MyDialog.showLoadingDiolog();

      final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      final dir = await getTemporaryDirectory();

      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);
      await GallerySaver.saveImage(file.path, albumName: "AI App Demo")
          .then((success) {});
      Get.back();
      MyDialog.success("Image Downloaded to Gallery!");
    } catch (e) {
      Get.back();
      MyDialog.error("Something Went Wrong (Try again in sometime)");
      log("DownloadImageE: $e");
    }
  }

  void shareImage() async {
    try {
      MyDialog.showLoadingDiolog();

      final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      final dir = await getTemporaryDirectory();

      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);
      Get.back();
      await Share.shareXFiles([XFile(file.path)],
          text:
              'Check out this Amazing Image created by Ai App Demo by Osman Kızılkaya');
    } catch (e) {
      Get.back();
      MyDialog.error("Something Went Wrong (Try again in sometime)");
      log("DownloadImageE: $e");
    }
  }

  Future<void> searchAiImage() async {
    if (textEditingController.text.trim().isNotEmpty) {
      status.value = Status.loading;

      imageList.value =
          await APIs.searchUnsplashImages(textEditingController.text);

      if (imageList.isEmpty) {
        MyDialog.error('Something went wrong (Try again in sometime)');

        return;
      }

      url.value = imageList.first;

      status.value = Status.complete;
    } else {
      MyDialog.info('Provide some beautiful image description!');
    }
  }
}
