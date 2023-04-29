import 'package:get/get.dart';
import 'package:wihaoh/util/jwt.dart';

const host = "http://3.35.89.120:8080";

//통신 역할
class BookProvider extends GetConnect {
  Future<Response> loan(String isbn) =>
      get("$host/api/loans/$isbn", headers: {"Authorization": jwtToken ?? ""});
  Future<Response> findAll() => get("$host/api/books");
  Future<Response> titleSearch(String title) =>
      get("$host/api/books?title=$title");
  Future<Response> authorSearch(String author) =>
      get("$host/api/books?author=$author");
  Future<Response> publisherSearch(String publisher) =>
      get("$host/api/books?publisher=$publisher");
  Future<Response> categorySearch(String category) =>
      get("$host/api/books?category=$category");
  Future<Response> titleCategorySearch(String title, String category) =>
      get("$host/api/books?title=$title&category=$category");
  Future<Response> authorCategorySearch(String author, String category) =>
      get("$host/api/books?author=$author&category=$category");
  Future<Response> publisherCategorySearch(String publisher, String category) =>
      get("$host/api/books?publisher=$publisher&category=$category");
}
