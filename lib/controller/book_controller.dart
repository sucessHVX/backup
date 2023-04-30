import 'package:get/get.dart';
import 'package:wihaoh/domain/book/book.dart';
import 'package:wihaoh/domain/book/book_repository.dart';

class BookController extends GetxController {
  final BookRepository _bookRepository = BookRepository();
  //final RxBool isLogin = false.obs; //UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트
  final books = <Book>[].obs;

  Future<int> loan(String isbn, String what) async {
    int result = await _bookRepository.loan(isbn, what);
    if (result == 1) {
      return 1;
    } else {
      return -1;
    }
  }

  Future<void> findAll() async {
    List<Book> books = await _bookRepository.findAll();
    this.books.value = books;
  }

  // 제목
  Future<int> title(String title) async {
    List<Book> books = await _bookRepository.title(title);
    return checkEmpty(books);
  }

  //저자
  Future<int> author(String author) async {
    List<Book> books = await _bookRepository.author(author);
    return checkEmpty(books);
  }

  //출판사
  Future<int> publisher(String publisher) async {
    List<Book> books = await _bookRepository.publisher(publisher);
    return checkEmpty(books);
  }

  //카테고리
  Future<int> category(String category) async {
    List<Book> books = await _bookRepository.category(category);
    return checkEmpty(books);
  }

  //제목, 카테고리
  Future<int> titleCategory(String title, String category) async {
    List<Book> books = await _bookRepository.titleCategory(title, category);
    return checkEmpty(books);
  }

  //저자, 카테고리
  Future<int> authorCategory(String author, String category) async {
    List<Book> books = await _bookRepository.authorCategory(author, category);
    return checkEmpty(books);
  }

  //출판사, 카테고리
  Future<int> publisherCategory(String publisher, String category) async {
    List<Book> books =
        await _bookRepository.publisherCategory(publisher, category);
    return checkEmpty(books);
  }

  int checkEmpty(List<Book> books) {
    this.books.value = books;
    if (books.isNotEmpty) {
      return 1;
    } else {
      return 0;
    }
  }
}
