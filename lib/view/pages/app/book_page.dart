import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wihaoh/controller/book_controller.dart';
import 'package:wihaoh/view/components/custom_elevated_button.dart';

class BookPage extends StatelessWidget {
  final BookController b = Get.find();
  BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("도서 목록"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('제목 : ${b.books[0].title}'),
            Text('저자 : ${b.books[0].author}'),
            Text('출판사 : ${b.books[0].publisher}'),
            Text('발행연도 : ${b.books[0].issueYear}'),
            Text('카테코리 : ${b.books[0].category}'),
            Text('ISBN : ${b.books[0].isbn}'),
            CustomElevatedButton(
                text: "대출",
                funPageRoute: () async {
                  int result = await b.loan(b.books[0].isbn!);
                  if (result == 1) {
                    print("성공");
                  } else {
                    print("실패");
                  }
                })
          ],
        ),
      ),
    );
  }
}
