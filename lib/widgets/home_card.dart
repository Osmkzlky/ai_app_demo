// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_app_demo/helpers/size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:ai_app_demo/model/home_type.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  const HomeCard({
    Key? key,
    required this.homeType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: homeType.letAlign
          ? InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              onTap: homeType.onTap,
              child: Row(
                children: [
                  SizedBox(
                      width: 40.w, child: LottieBuilder.asset(homeType.lottie)),
                  Spacer(),
                  Text(
                    homeType.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                  )
                ],
              ),
            )
          : InkWell(
              onTap: homeType.onTap,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Row(
                children: [
                  Text(homeType.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.sp)),
                  Spacer(),
                  SizedBox(
                      width: 40.w,
                      child: Padding(
                        padding: homeType.padding,
                        child: LottieBuilder.asset(homeType.lottie),
                      )),
                ],
              ),
            ),
    ).animate().fade(begin: 0.5, duration: 1.seconds, curve: Curves.easeIn);
  }
}
