import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _selectedCategory = '제목'; // 초기값으로 제목 선택
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
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
                  Expanded(
                    flex: 8,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: '$_selectedCategory을(를) 입력해주세요',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.grey[200],
                child: const Center(
                  child: Text('검색 결과가 없습니다.'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
