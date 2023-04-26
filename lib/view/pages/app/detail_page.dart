import 'package:flutter/material.dart';
import 'package:wihaoh/util/jwt.dart';
import 'package:wihaoh/view/components/custom_elevated_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _selectedCategory = '제목'; // 초기값으로 제목 선택
  final TextEditingController _searchController =
      TextEditingController(text: printQuery);
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
                  flex: 2,
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
                  child: Text('카테고리'),
                ),
                const SizedBox(width: 31),
                Flexible(
                  flex: 11,
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
            CustomElevatedButton(text: "검색", funPageRoute: () async {}),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white10,
                  child: const Center(
                    child: Text('검색 결과가 없습니다.'),
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
