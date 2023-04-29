import 'package:get/get_connect/http/src/response/response.dart';
import 'package:wihaoh/domain/book/book.dart';
import 'package:wihaoh/domain/book/book_provider.dart';

//통신을 호출해서 응답되는 데이터 가공(json 형식으로 들어오니 dart 오브젝트로)
class BookRepository {
  // _ 언더바를 변수 앞에 쓰면 private됨
  final BookProvider _bookProvider = BookProvider();

  Future<int> loan(String isbn) async {
    Response response = await _bookProvider.loan(isbn);
    if (response.isOk == true) {
      return 1;
    } else {
      return -1;
    }
  }

  Future<List<Book>> findAll() async {
    Response response = await _bookProvider.findAll();
    dynamic body = response.body;
    List<dynamic> temp = body;
    List<Book> book = temp.map((book) => Book.fromJson(book)).toList();
    return book;
  }

  Future<List<Book>> title(String title) async {
    Response response = await _bookProvider.titleSearch(title);
    dynamic body = response.body;
    List<dynamic> temp = body;
    List<Book> book = temp.map((book) => Book.fromJson(book)).toList();
    return book;
  }

  Future<Book> author(String author) async {
    Response response = await _bookProvider.authorSearch(author);
    dynamic body = response.body;
    Book book = Book.fromJson(body);
    if (book.title != null) {
      return book;
    } else {
      return Book();
    }
  }

  Future<Book> publisher(String publisher) async {
    Response response = await _bookProvider.publisherSearch(publisher);
    dynamic body = response.body;
    Book book = Book.fromJson(body);
    if (book.title != null) {
      return book;
    } else {
      return Book();
    }
  }

  Future<Book> category(String category) async {
    Response response = await _bookProvider.categorySearch(category);
    dynamic body = response.body;
    Book book = Book.fromJson(body);
    if (book.title != null) {
      return book;
    } else {
      return Book();
    }
  }

  Future<Book> titleCategory(String title, String category) async {
    Response response =
        await _bookProvider.titleCategorySearch(title, category);
    dynamic body = response.body;
    Book book = Book.fromJson(body);
    if (book.title != null) {
      return book;
    } else {
      return Book();
    }
  }

  Future<Book> authorCategory(String author, String category) async {
    Response response =
        await _bookProvider.authorCategorySearch(author, category);
    dynamic body = response.body;
    Book book = Book.fromJson(body);
    if (book.title != null) {
      return book;
    } else {
      return Book();
    }
  }

  Future<Book> publisherCategory(String publisher, String category) async {
    Response response =
        await _bookProvider.publisherCategorySearch(publisher, category);
    dynamic body = response.body;
    Book book = Book.fromJson(body);
    if (book.title != null) {
      return book;
    } else {
      return Book();
    }
  }
}
