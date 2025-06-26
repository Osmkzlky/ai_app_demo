import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:ai_app_demo/helpers/global.dart';
import 'package:http/http.dart';

class APIs {
  static Future<String> getAnswer(String question) async {
    try {
      final res =
          await post(Uri.parse("https://api.openai.com/v1/chat/completions"),
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
                HttpHeaders.authorizationHeader: "Bearer $apiKey"
              },
              body: jsonEncode({
                "model": "gpt-4o-mini",
                "max_tokens": 2000,
                "temperature": 0,
                "messages": [
                  {"role": "user", "content": question},
                ]
              }));
      final data = jsonDecode(res.body);
      log("res: ${data}");

      return data["choices"][0]["message"]["content"];
    } catch (e) {
      log("getAnserE: ${e}");
      return "Something went wrong (Try again in sometime)";
    }
  }

  static Future<List<String>> searchUnsplashImages(String query) async {
   // const String apiKey = ''; api yazınız
    final url = Uri.parse(
        'https://api.unsplash.com/search/photos?query=$query&client_id=$apiKey');

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        return List.from(data['results'])
            .map((e) => e['urls']['regular'].toString())
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
