import 'package:ai_app_demo/helpers/size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset("assets/animation/loading.json", height: 10.h);
  }
}
