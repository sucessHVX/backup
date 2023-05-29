import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wihaoh/controller/book_controller.dart';
import 'package:wihaoh/controller/dto/loan_resp_dto.dart';
import 'package:wihaoh/controller/user_controller.dart';
import 'package:wihaoh/view/components/custom_elevated_button.dart';
import 'package:wihaoh/view/pages/app/book_detail_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController u = Get.put(UserController());
    BookController b = Get.put(BookController());
    void returnLoan(int index) {
      u.princ.value.loans?.removeAt(index);
      u.princ.refresh();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("회원 정보"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://png.pngtree.com/png-vector/20191009/ourmid/pngtree-user-icon-png-image_1796659.jpg"),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "${u.princ.value.name}",
                  style: const TextStyle(fontSize: 3 * 16), // 폰트 크기를 3배로 설정
                ),
              ],
            ),
            const Divider(
              thickness: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "대출 목록",
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Obx(
              () => u.princ.value.loans?.isEmpty ?? true
                  ? Container() // 리스트가 비어있는 경우 아무 내용도 표시하지 않음
                  : Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        shrinkWrap: true,
                        itemCount: u.princ.value.loans?.length != null
                            ? u.princ.value.loans!.length * 2 - 1
                            : 0,
                        itemBuilder: (context, index) {
                          // 구분선을 위한 인덱스 체크
                          if (index.isOdd) {
                            return const Divider(
                              thickness: 5, // 구분선의 두께 설정
                            );
                          }
                          // 실제 아이템 인덱스 계산
                          final itemIndex = index ~/ 2;
                          final loan = u.princ.value.loans?[itemIndex];
                          return Row(
                            children: [
                              Container(
                                width: 150,
                                height: 200,
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
                                  loan?.book?.imgUrl ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '제목: ${loan?.book?.title}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 3,
                                    ),
                                    Text(
                                      '대출일: ${loan?.borrowDate}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Divider(
                                      thickness: 3,
                                    ),
                                    Text(
                                      '반납일: ${loan?.returnDate}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Divider(
                                      thickness: 3,
                                    ),
                                    CustomElevatedButton(
                                      text: "반납",
                                      funPageRoute: () async {
                                        returnDialog(context, b, loan,
                                            returnLoan, itemIndex);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> returnDialog(BuildContext context, BookController b,
      LoanRespDto? loan, void Function(int index) returnLoan, int itemIndex) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("반납"),
          content: const Text('반납하시겠습니까'),
          actions: [
            TextButton(
              child: const Text('확인'),
              onPressed: () async {
                reLoad(context, "바코드를 찍어주세요...");
                await Future.delayed(const Duration(seconds: 2));
                int result = await b.loan(loan!.book!.isbn!, "반납");
                if (result == 1) {
                  Get.snackbar("반납 성공", "반납이 완료되었습니다");
                  returnLoan(itemIndex);
                } else {
                  Get.snackbar("반납 실패", "반납이 불가능합니다");
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
