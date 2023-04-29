import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wihaoh/controller/user_controller.dart';
import 'package:wihaoh/util/clear.dart';
import 'package:wihaoh/view/components/custom_elevated_button.dart';
import 'package:wihaoh/view/components/custom_text_form_field.dart';
import 'package:wihaoh/view/pages/user/login_page.dart';
import 'package:wihaoh/util/validator_util.dart';

class JoinPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final UserController u = Get.find();
  final _id = TextEditingController();
  final _pw = TextEditingController();
  final _name = TextEditingController();

  JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: const Text(
                "도서관 회원가입",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _joinForm(),
          ],
        ),
      ),
    );
  }

  Widget _joinForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _id,
            hint: "ID",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _pw,
            hint: "pw",
            funValidator: validatePassword(),
          ),
          CustomTextFormField(
            controller: _name,
            hint: "이름",
            funValidator: validateName(),
          ),
          CustomElevatedButton(
            text: "회원가입",
            funPageRoute: () async {
              if (_formkey.currentState!.validate()) {
                int result =
                    await u.joinController(_id.text, _pw.text, _name.text);
                loginClear();
                if (result == 1) {
                  Get.off(() => LoginPage());
                  Get.snackbar("회원가입 성공", "로그인 해주세요");
                } else {
                  Get.snackbar("회원가입 실패", "이미 가입된 ID입니다");
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
