import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wihaoh/controller/book_controller.dart';
import 'package:wihaoh/controller/user_controller.dart';
import 'package:wihaoh/size.dart';
import 'package:wihaoh/view/pages/app/book_page.dart';
import 'package:wihaoh/view/pages/app/search_page.dart';
import 'package:wihaoh/view/pages/user/login_page.dart';
import 'package:wihaoh/view/pages/user/user_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController u = Get.find();
    final BookController b = Get.put(BookController());
    return WillPopScope(
      onWillPop: () async {
        if (_lastBackPressed == null ||
            DateTime.now().difference(_lastBackPressed!) >
                const Duration(seconds: 2)) {
          _lastBackPressed = DateTime.now();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('뒤로 버튼을 한번 더 누르면 종료')),
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        drawer: _navigation(context),
        appBar: AppBar(
          title: const Center(
            child: Text("도서관 안내 어플"),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await u.userController();
                Get.to(() => const UserPage());
              },
              icon: const Icon(Icons.person),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildIconButton(Icons.search, '도서검색', () {
                    Get.to(() => const SearchPage());
                  }),
                  buildIconButton(Icons.book, '도서목록', () async {
                    await b.findAll();
                    Get.to(() => BookPage());
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildIconButton(Icons.favorite, '인기도서', () {}),
                  buildIconButton(Icons.fiber_new, '신간도서', () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  DateTime? _lastBackPressed;

  Widget _navigation(BuildContext context) {
    UserController u = Get.find(); //다시 찾기
    return Container(
      //메뉴
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0), //모든면에 패딩
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await u.userController();
                Get.to(() => const UserPage());
              },
              child: const Text(
                "회원정보",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            const Divider(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                u.logout();
                Get.off(() => LoginPage());
              },
              child: const Text(
                "로그아웃",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            const Divider(),
          ]),
        ),
      ),
    );
  }

  Widget buildIconButton(
      IconData iconData, String label, VoidCallback onPressed) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(iconData),
          onPressed: onPressed,
          iconSize: 80.0,
          color: Colors.blue,
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
