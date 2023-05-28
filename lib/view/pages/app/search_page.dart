import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wihaoh/controller/book_controller.dart';
import 'package:wihaoh/util/jwt.dart';
import 'package:wihaoh/view/pages/app/search_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final BookController b = Get.find();
  final TextEditingController _searchController = TextEditingController();
  final List<String> _searchHistory = [];

  Future<void> _saveSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('search_history', _searchHistory);
  }

  Future<void> _loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    //await prefs.clear();
    final history = prefs.getStringList('search_history');
    if (history != null) {
      setState(() {
        _searchHistory.addAll(history);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadSearchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: '제목으로 검색하세요',
          ),
          onSubmitted: (query) async {
            final trimmedQuery = query.trim();
            if (trimmedQuery.isNotEmpty) {
              setState(() {
                _searchHistory.insert(0, trimmedQuery);
                _saveSearchHistory();
              });
              searchQuery = query;
              await b.title(_searchController.text);
              Get.to(() => const SearchDetailPage());
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            iconSize: 35,
            onPressed: () async {
              // 검색 버튼을 누를 때 동작하는 함수
              final query = _searchController.text.trim();
              if (query.isNotEmpty) {
                setState(() {
                  _searchHistory.insert(0, query);
                  _saveSearchHistory();
                });
              }
              searchQuery = query;
              await b.title(_searchController.text);
              Get.to(() => const SearchDetailPage());
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '최근 검색어',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: _searchHistory.length,
                itemBuilder: (BuildContext context, int index) {
                  final query = _searchHistory[index];
                  return ListTile(
                    leading: const Icon(Icons.history),
                    title: Text(query),
                    onTap: () async {
                      searchQuery = query;
                      await b.title(query);
                      Get.to(() => const SearchDetailPage());
                    },
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _searchHistory.removeAt(index);
                          _saveSearchHistory();
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
