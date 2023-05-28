import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wihaoh/controller/book_controller.dart';
import 'package:wihaoh/view/pages/app/book_detail_page.dart';

class BookPage extends StatelessWidget {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  final BookController b = Get.find();
  BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("도서 목록"),
      ),
      body: Obx(
        () => RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            await b.findAll();
          },
          child: ListView.separated(
            itemCount: b.books.length,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  await Get.to(() => BookDetailPage(index));
                },
                child: Row(
                  children: [
                    Hero(
                      tag: index,
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
                          b.books[index].imgUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${b.books[index].title!} / ${b.books[index].author!} 지음",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
              thickness: 5, // 구분선의 두께 설정
            ),
          ),
        ),
      ),
    );
  }
}
