import 'package:ai_app_demo/controller/imageAIController.dart';
import 'package:ai_app_demo/helpers/size.dart';
import 'package:ai_app_demo/widgets/custom_btn.dart';
import 'package:ai_app_demo/widgets/custom_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ImageFeature extends StatelessWidget {
  final controller = Get.put(ImageAiController());
  ImageFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AI Image Creator"),
          actions: [
            Obx(() => controller.status.value == Status.complete
                ? IconButton(
                    padding: const EdgeInsets.only(right: 6),
                    onPressed: controller.shareImage,
                    icon: const Icon(Icons.share))
                : const SizedBox())
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 15.h),
          children: [
            TextFormField(
              minLines: 2,
              maxLines: 5,
              controller: controller.textEditingController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText:
                      "Imagine something wonderful & innovative\nType here & I will create for you 😀",
                  hintStyle: TextStyle(fontSize: 15.sp),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 2.h),
                height: 50.h,
                alignment: Alignment.center,
                child: Obx(() => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: aiImage()))),
            Obx(() => controller.imageList.isEmpty
                ? const SizedBox()
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(bottom: 10),
                    physics: const BouncingScrollPhysics(),
                    child: Wrap(
                      spacing: 10,
                      children: controller.imageList
                          .map((e) => InkWell(
                                onTap: () {
                                  controller.url.value = e;
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  child: CachedNetworkImage(
                                    imageUrl: e,
                                    height: 100,
                                    errorWidget: (context, url, error) =>
                                        const SizedBox(),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  )),
            CustomBtn(
                onPress: () {
                  controller.searchAiImage();
                },
                text: "Create"),
          ],
        ),
        floatingActionButton: Obx(() => controller.status == Status.complete
            ? Padding(
                padding: EdgeInsets.all(5),
                child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: controller.downloadImage,
                  child: const Icon(
                    Icons.save_alt_outlined,
                    color: Colors.white,
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.all(5),
                child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: controller.downloadImage,
                  child: const Icon(
                    Icons.save_alt_outlined,
                    color: Colors.white,
                  ),
                ),
              )));
  }

  Widget aiImage() => switch (controller.status.value) {
        Status.none =>
          LottieBuilder.asset("assets/animation/ai_play.json", height: 30.h),
        Status.complete => CachedNetworkImage(
            imageUrl: controller.url.value,
            placeholder: (context, url) => const CustomLoading(),
            errorWidget: (context, url, error) => Icon(Icons.error)),
        Status.loading => const CustomLoading()
      };
}
