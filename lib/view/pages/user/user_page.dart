import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wihaoh/controller/user_controller.dart';
import 'package:wihaoh/view/components/custom_elevated_button.dart';
import 'package:wihaoh/view/pages/app/book_detail_page.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 60, // 이미지 반지름(radius)를 50으로 가정하고 3배로 설정
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
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  Row(
                    children: [
                      Hero(
                        tag: u.princ.value.loan!.book!,
                        child: Container(
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
                            u.princ.value.loan!.book!.imgUrl,
                            fit: BoxFit.cover,
                          ),
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
                                  '제목: ${u.princ.value.loan!.book?.title}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 3, // 선의 두께를 3으로 설정
                            ),
                            Text(
                              '대출일: ${u.princ.value.loan!.borrowDate}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Divider(
                              thickness: 3, // 선의 두께를 3으로 설정
                            ),
                            Text(
                              '반납일: ${u.princ.value.loan!.returnDate}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Divider(
                              thickness: 3, // 선의 두께를 3으로 설정
                            ),
                            CustomElevatedButton(
                                text: "반납",
                                funPageRoute: () {
                                  loanOrNot(context, "반납", 0);
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
