import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wihaoh/controller/book_controller.dart';
import 'package:wihaoh/view/components/custom_elevated_button.dart';

class BookDetailPage extends StatelessWidget {
  final int? index;
  final BookController b = Get.find();
  BookDetailPage(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double imageWidth = screenWidth * 0.55;
    double imageHeight = screenHeight * 0.38;
    double buttonWidth = screenWidth * 0.45;
    double buttonHeight = screenHeight * 0.065;

    return Scaffold(
      appBar: AppBar(
        title: const Text("도서 목록"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Hero(
                  tag: index!,
                  child: Container(
                    width: imageWidth,
                    height: imageHeight,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          offset: const Offset(10, 10),
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: Image.network(
                      b.books[index!].imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dividerThickness: 3,
                    columns: [
                      const DataColumn(label: Text('제목')),
                      DataColumn(label: Text('${b.books[index!].title}')),
                    ],
                    rows: [
                      DataRow(cells: [
                        const DataCell(Text('저자')),
                        DataCell(Text('${b.books[index!].author}')),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('출판사')),
                        DataCell(Text('${b.books[index!].publisher}')),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('발행연도')),
                        DataCell(Text('${b.books[index!].issueYear}')),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('카테고리')),
                        DataCell(Text('${b.books[index!].category}')),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('ISBN')),
                        DataCell(Text('${b.books[index!].isbn}')),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: buttonWidth,
                      height: buttonHeight,
                      child: CustomElevatedButton(
                        text: "대출",
                        funPageRoute: () {
                          loanOrNot(context, "대출", index!);
                        },
                      ),
                    ),
                    SizedBox(
                      width: buttonWidth,
                      height: buttonHeight,
                      child: CustomElevatedButton(
                        text: "안내",
                        funPageRoute: () async {
                          reLoad(context, "길안내 중입니다...");
                          await Future.delayed(const Duration(seconds: 4));
                          Get.snackbar("도착", "목적지에 도착했습니다");
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loanOrNot(BuildContext context, String name, int index) {
    final BookController b = Get.find();
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
                reLoad(context, "바코드를 찍어주세요...");
                await Future.delayed(const Duration(seconds: 2));
                int result = await b.loan(b.books[index].isbn!, name);
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

Future<dynamic> reLoad(BuildContext context, String ex) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const CircularProgressIndicator(
                strokeWidth: 5,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              ex,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                fontSize: 30,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );

  if (ex == "바코드를 찍어주세요...") {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);
  } else {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pop(context);
  }
}
