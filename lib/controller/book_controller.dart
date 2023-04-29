import 'package:get/get.dart';
import 'package:wihaoh/domain/book/book.dart';
import 'package:wihaoh/domain/book/book_repository.dart';

class BookController extends GetxController {
  final BookRepository _bookRepository = BookRepository();
  //final RxBool isLogin = false.obs; //UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트
  final books = <Book>[].obs;

  Future<int> loan(String isbn) async {
    int result = await _bookRepository.loan(isbn);
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
  Future<void> title(String title) async {
    List<Book> books = await _bookRepository.title(title);
    this.books.value = books;
  }

  // //저자
  // Future<int> author(String author) async {
  //   Book book = await _bookRepository.author(author);
  //   if (book.title != null) {
  //     this.book.value = book;
  //     return 1;
  //   } else {
  //     return -1;
  //   }
  // }

  // //출판사
  // Future<int> publisher(String publisher) async {
  //   Book book = await _bookRepository.publisher(publisher);
  //   if (book.title != null) {
  //     this.book.value = book;
  //     return 1;
  //   } else {
  //     return -1;
  //   }
  // }

  // //카테고리
  // Future<int> category(String category) async {
  //   Book book = await _bookRepository.category(category);
  //   if (book.title != null) {
  //     this.book.value = book;
  //     return 1;
  //   } else {
  //     return -1;
  //   }
  // }

  // //제목, 카테고리
  // Future<int> titleCategory(String title, String category) async {
  //   Book book = await _bookRepository.titleCategory(title, category);
  //   if (book.title != null) {
  //     this.book.value = book;
  //     return 1;
  //   } else {
  //     return -1;
  //   }
  // }

  // //저자, 카테고리
  // Future<int> authorCategory(String author, String category) async {
  //   Book book = await _bookRepository.authorCategory(author, category);
  //   if (book.title != null) {
  //     this.book.value = book;
  //     return 1;
  //   } else {
  //     return -1;
  //   }
  // }

  // //출판사, 카테고리
  // Future<int> publisherCategory(String publisher, String category) async {
  //   Book book = await _bookRepository.publisherCategory(publisher, category);
  //   if (book.title != null) {
  //     this.book.value = book;
  //     return 1;
  //   } else {
  //     return -1;
  //   }
  // }
}
