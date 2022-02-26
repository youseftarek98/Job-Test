import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_one/view/home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX api call',
      getPages: [
        GetPage(name: '/1', page: ()=> HomeView())
      ],
      home: HomeView(),
    );
  }
}
