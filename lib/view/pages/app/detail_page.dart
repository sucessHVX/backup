import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wihaoh/controller/book_controller.dart';
import 'package:wihaoh/util/jwt.dart';
import 'package:wihaoh/view/components/custom_elevated_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final BookController b = Get.find();
  String _selectedCategory = '제목'; // 초기값으로 제목 선택
  final TextEditingController _searchController =
      TextEditingController(text: searchQuery);
  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 1,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: '제목',
                        child: Text('제목'),
                      ),
                      DropdownMenuItem(
                        value: '저자',
                        child: Text('저자'),
                      ),
                      DropdownMenuItem(
                        value: '출판사',
                        child: Text('출판사'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  flex: 8,
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Flexible(
                  flex: 2,
                  child: Text(
                    '카테고리',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                const SizedBox(width: 46),
                Flexible(
                  flex: 8,
                  child: TextField(
                    controller: _categoryController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '카테고리를 입력해주세요',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomElevatedButton(
                text: "검색",
                funPageRoute: () async {
                  searchQuery = _searchController.text;
                  searchCategory = _categoryController.text;
                  int result = 0;
                  if (_searchController.text == "" &&
                      _categoryController.text == "") {
                    print("검색 결과가 없습니다");
                  } else {
                    if (_selectedCategory == "제목" &&
                        _categoryController.text == "") {
                      await b.title(_searchController.text);
                      print('제목 : ${b.books[0].title}');
                      print('저자 : ${b.books[0].author}');
                      print('출판사 : ${b.books[0].publisher}');
                      print('카테코리 : ${b.books[0].category}');
                      print('발행연도 : ${b.books[0].issueYear}');
                      print('ISBN : ${b.books[0].isbn}');
                    }

                    //   } else if (_selectedCategory == "저자" &&
                    //       _categoryController.text == "") {
                    //     result = await b.author(_searchController.text);
                    //     if (result == 1) {
                    //       print("성공");
                    //     } else {
                    //       print("실패");
                    //     }
                    //   } else if (_selectedCategory == "출판사" &&
                    //       _categoryController.text == "") {
                    //     result = await b.publisher(_searchController.text);
                    //     if (result == 1) {
                    //       print("성공");
                    //     } else {
                    //       print("실패");
                    //     }
                    //   } else if (_searchController.text == "") {
                    //     result = await b.category(_categoryController.text);
                    //     if (result == 1) {
                    //       print("성공");
                    //     } else {
                    //       print("실패");
                    //     }
                    //   } else if (_selectedCategory == "제목") {
                    //     result = await b.titleCategory(
                    //         _searchController.text, _categoryController.text);
                    //     if (result == 1) {
                    //       print("성공");
                    //     } else {
                    //       print("실패");
                    //     }
                    //   } else if (_selectedCategory == "저자") {
                    //     result = await b.authorCategory(
                    //         _searchController.text, _categoryController.text);
                    //     if (result == 1) {
                    //       print("성공");
                    //     } else {
                    //       print("실패");
                    //     }
                    //   } else if (_selectedCategory == "출판사") {
                    //     result = await b.publisherCategory(
                    //         _searchController.text, _categoryController.text);
                    //     if (result == 1) {
                    //       print("성공");
                    //     } else {
                    //       print("실패");
                    //     }
                    //   }
                  }
                }),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white10,
                  child: Column(
                    children: [
                      Text('제목 : ${b.books[0].title}'),
                      Text('저자 : ${b.books[0].author}'),
                      Text('출판사 : ${b.books[0].publisher}'),
                      Text('발행연도 : ${b.books[0].issueYear}'),
                      Text('카테코리 : ${b.books[0].category}'),
                      Text('ISBN : ${b.books[0].isbn}'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
