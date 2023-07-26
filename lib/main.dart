import 'package:flutter/material.dart';
import 'package:new_project/posts/post_view.dart';
import 'package:get/get.dart';
import 'langauges/language_view.dart';
import 'posts/post_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true, 
      ),
      
      initialRoute: '/posts',
      getPages: [
        GetPage(name: '/posts', page: () => PostWidget(userSettings: UserSettings(language: 'en'))),
        GetPage(name: '/language_view' , page: () => LanguageView()),
      ],
    );
  }
}