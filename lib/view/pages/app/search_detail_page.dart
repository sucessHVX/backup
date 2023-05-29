import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wihaoh/controller/book_controller.dart';
import 'package:wihaoh/util/jwt.dart';
import 'package:wihaoh/view/components/custom_elevated_button.dart';
import 'package:wihaoh/view/pages/app/book_detail_page.dart';

class SearchDetailPage extends StatefulWidget {
  const SearchDetailPage({super.key});

  @override
  _SearchDetailPageState createState() => _SearchDetailPageState();
}

class _SearchDetailPageState extends State<SearchDetailPage> {
  final BookController b = Get.find();
  String _selectedCategory = '제목'; // 초기값으로 제목 선택
  String _selectedCategory2 = '과학기술'; // 초기값으로 제목 선택
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
                    onSubmitted: (value) {
                      _performSearch(); // 검색 수행하는 함수 호출
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: DropdownButtonFormField<String>(
                    value: _selectedCategory2,
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory2 = value!;
                        _categoryController.text = value;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: '과학기술',
                        child: Text('과학기술'),
                      ),
                      DropdownMenuItem(
                        value: '문화예술',
                        child: Text('문화예술'),
                      ),
                      DropdownMenuItem(
                        value: '인문사회',
                        child: Text('인문사회'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 8,
                  child: TextField(
                    controller: _categoryController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '카테고리를 입력해주세요',
                    ),
                    onSubmitted: (value) {
                      _performSearch(); // 검색 수행하는 함수 호출
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomElevatedButton(
                text: "검색",
                funPageRoute: () async {
                  setState(() {});
                  searchQuery = _searchController.text;
                  searchCategory = _categoryController.text;
                  int result = 0;

                  if (_selectedCategory == "제목" &&
                      _categoryController.text == "") {
                    result = await b.title(_searchController.text);
                  } else if (_selectedCategory == "저자" &&
                      _categoryController.text == "") {
                    result = await b.author(_searchController.text);
                  } else if (_selectedCategory == "출판사" &&
                      _categoryController.text == "") {
                    result = await b.publisher(_searchController.text);
                  } else if (_searchController.text == "") {
                    result = await b.category(_categoryController.text);
                  } else if (_selectedCategory == "제목") {
                    result = await b.titleCategory(
                        _searchController.text, _categoryController.text);
                  } else if (_selectedCategory == "저자") {
                    result = await b.authorCategory(
                        _searchController.text, _categoryController.text);
                  } else if (_selectedCategory == "출판사") {
                    result = await b.publisherCategory(
                        _searchController.text, _categoryController.text);
                  }
                }),
            const SizedBox(height: 10),
            Obx(
              () => Expanded(
                child: SingleChildScrollView(
                  child: b.books.isEmpty
                      ? const Center(
                          child: Text(
                            '검색 결과가 없습니다.',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: b.books.length * 2 -
                              1, // 구분선을 위해 아이템 수에 구분선 수를 추가
                          itemBuilder: (context, index) {
                            // 구분선을 위한 인덱스 체크
                            if (index.isOdd) {
                              return const Divider(
                                thickness: 5, // 구분선의 두께 설정
                              );
                            }

                            // 실제 아이템 인덱스 계산
                            final itemIndex = index ~/ 2;

                            return GestureDetector(
                              onTap: () async {
                                await Get.to(() => BookDetailPage(itemIndex));
                              },
                              child: Row(
                                children: [
                                  Hero(
                                    tag: itemIndex,
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
                                            color:
                                                Colors.black.withOpacity(0.3),
                                          ),
                                        ],
                                      ),
                                      child: Image.network(
                                        b.books[itemIndex].imgUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${b.books[itemIndex].title!} / ${b.books[itemIndex].author!} 지음",
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
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _performSearch() async {
    setState(() {});
    searchQuery = _searchController.text;
    searchCategory = _categoryController.text;
    int result = 0;

    if (_selectedCategory == "제목" && _categoryController.text == "") {
      result = await b.title(_searchController.text);
    } else if (_selectedCategory == "저자" && _categoryController.text == "") {
      result = await b.author(_searchController.text);
    } else if (_selectedCategory == "출판사" && _categoryController.text == "") {
      result = await b.publisher(_searchController.text);
    } else if (_searchController.text == "") {
      result = await b.category(_categoryController.text);
    } else if (_selectedCategory == "제목") {
      result = await b.titleCategory(
          _searchController.text, _categoryController.text);
    } else if (_selectedCategory == "저자") {
      result = await b.authorCategory(
          _searchController.text, _categoryController.text);
    } else if (_selectedCategory == "출판사") {
      result = await b.publisherCategory(
          _searchController.text, _categoryController.text);
    }
  }
}
