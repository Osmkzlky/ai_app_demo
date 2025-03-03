// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_app_demo/helpers/size.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:ai_app_demo/model/message.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return message.msgType == MessageType.bot
        ? Row(
            children: [
              CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 24,
                  )),
              Container(
                constraints: BoxConstraints(maxWidth: 60.w),
                margin: EdgeInsets.only(bottom: 5.h, left: 1.w),
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: message.msg.isEmpty
                    ? AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Please wait...',
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        repeatForever: true,
                      )
                    : Text(message.msg),
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 60.w),
                margin: EdgeInsets.only(bottom: 5.h, left: 1.w),
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                child: Text(
                  message.msg,
                  textAlign: TextAlign.end,
                ),
              ),
              CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 24,
                  )),
            ],
          );
  }
}
