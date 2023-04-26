import 'package:get/get_connect/http/src/response/response.dart';
import 'package:wihaoh/domain/book/book_provider.dart';

//통신을 호출해서 응답되는 데이터 가공(json 형식으로 들어오니 dart 오브젝트로)
class BookRepository {
  // _ 언더바를 변수 앞에 쓰면 private됨
  final BookProvider _bookProvider = BookProvider();

  Future<void> title(String title) async {
    Response response = await _bookProvider.titleSearch(title);
    dynamic body = response.body;
    print(title);
    print("연결 확인 : ${response.isOk}");
    print("body : $body");
  }
}
