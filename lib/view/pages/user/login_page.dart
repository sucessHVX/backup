import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wihaoh/controller/user_controller.dart';
import 'package:wihaoh/util/clear.dart';
import 'package:wihaoh/view/components/custom_elevated_button.dart';
import 'package:wihaoh/view/components/custom_text_form_field.dart';
import 'package:wihaoh/util/validator_util.dart';
import 'package:wihaoh/view/pages/app/home_page.dart';
import 'package:wihaoh/view/pages/user/join_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController());
  final _username = TextEditingController();
  final _password = TextEditingController();

  Future<void> _saveCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', _username.text);
    await prefs.setString('pw', _password.text);
  }

  Future<void> _loadCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('id');
    final password = prefs.getString('pw');
    if (username != null && password != null) {
      _username.text = username;
      _password.text = password;
    }
  }

  LoginPage({Key? key}) : super(key: key) {
    _loadCredentials();
  }

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
                "도서관 로그인",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _username,
            hint: "ID",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "pw",
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () async {
              if (_formkey.currentState!.validate()) {
                //trim() 공백제거 해줌
                int result = await u.loginController(
                    _username.text.trim(), _password.text.trim());
                if (result == 1) {
                  loginClear();
                  _saveCredentials();
                  Get.off(() => HomePage());
                } else {
                  Get.snackbar("로그인 실패", "ID, PW 확인하세요");
                }
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(() => JoinPage());
            },
            child: const Text("회원가입"),
          ),
        ],
      ),
    );
  }
}
