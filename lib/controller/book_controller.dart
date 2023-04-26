import 'package:get/get.dart';
import 'package:wihaoh/domain/book/book.dart';
import 'package:wihaoh/domain/book/book_repository.dart';

class BookController extends GetxController {
  final BookRepository _bookRepository = BookRepository();
  //final RxBool isLogin = false.obs; //UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트
  final books = <Book>[].obs; //obs가 관찰 가능한 변수
  final book = Book().obs;

  //제목
  // Future<int> title() async {
  //   int result = await _bookRepository.title();
  //   this.books.value = books;
  // }

  //저자

  //출판사

  //카테고리

  //제목, 카테고리

  //저자, 카테고리

  //출판사, 카테고리
}
