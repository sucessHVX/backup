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
            Text('제목 : ${b.books[3].title}'),
            Text('저자 : ${b.books[3].author}'),
            Text('출판사 : ${b.books[3].publisher}'),
            Text('발행연도 : ${b.books[3].issueYear}'),
            Text('카테코리 : ${b.books[3].category}'),
            Text('ISBN : ${b.books[3].isbn}'),
            CustomElevatedButton(
                text: "대출",
                funPageRoute: () {
                  loanOrNot(context, "대출");
                }),
            CustomElevatedButton(
                text: "반납",
                funPageRoute: () {
                  loanOrNot(context, "반납");
                })
          ],
        ),
      ),
    );
  }

  void loanOrNot(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name),
          content: Text('$name하시겠습니까'),
          actions: [
            TextButton(
              child: const Text('확인'),
              onPressed: () async {
                int result = await b.loan(b.books[3].isbn!, name);
                if (result == 1) {
                  Get.snackbar("$name 성공", "$name이 완료되었습니다");
                } else {
                  Get.snackbar("$name 실패", "$name이 불가능합니다");
                }
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
