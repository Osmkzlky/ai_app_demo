// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_app_demo/helpers/size.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  const CustomBtn({
    Key? key,
    required this.onPress,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(40.w, 5.h),
              backgroundColor: Colors.blue,
              elevation: 5),
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),
          )),
    );
  }
}
