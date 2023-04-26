import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wihaoh/view/pages/user/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, //배너 없애기
      home: LoginPage(),
    );
  }
}
