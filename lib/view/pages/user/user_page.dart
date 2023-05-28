import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wihaoh/controller/user_controller.dart';
import 'package:wihaoh/view/components/custom_elevated_button.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController u = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("회원 정보"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("회원 이름 : ${u.princ.value.name}"),
            Text("회원 아이디 : ${u.princ.value.username}"),
            const Text("대출목록"),
            // Text("제목 : ${u.princ.value.loan!.book?.title}"),
            // Text("대출일 : ${u.princ.value.loan!.borrowDate}"),
            // Text("반납일 : ${u.princ.value.loan!.returnDate}"),
            CustomElevatedButton(
                text: "반납",
                funPageRoute: () {
                  // loanOrNot(context, "반납");
                  print(u.princ.value.loan!.book);
                }),
          ],
        ),
      ),
    );
  }
}
