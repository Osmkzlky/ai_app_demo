import 'package:ai_app_demo/apis/apis.dart';
import 'package:ai_app_demo/model/home_type.dart';
import 'package:ai_app_demo/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    APIs.getAnswer("Hii");
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text("AI Assistant"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.brightness_4_rounded))
          ],
        ),
        body: ListView(
          children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
        ));
  }
}
