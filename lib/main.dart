import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_application/view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ringtone App',
      home: HomeView(),
    );
  }
}
