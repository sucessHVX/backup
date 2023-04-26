import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wihaoh/controller/user_controller.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController u = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("회원 이름 : ${u.principal.value.name}"),
            Text("회원 아이디 : ${u.principal.value.username}"),
            Text("대출 : ${u.principal.value.loans}"),
            // Text("회원 가입 날짜 : ${u.principal.value.created}"),
          ],
        ),
      ),
    );
  }
}
