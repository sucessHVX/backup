import 'package:get/get.dart';
import 'package:wihaoh/util/jwt.dart';

const host = "http://3.35.89.120:8080";

//통신 역할
class PostProvider extends GetConnect {
  //Map타입으로 전송을 해줘야 함 post방식으로
  Future<Response> titleSearch(String title) =>
      get("$host/api/books?title=$title",
          headers: {"Authorization": jwtToken ?? ""});
  Future<Response> authorSearch(String author) =>
      get("$host/api/books?author=$author",
          headers: {"Authorization": jwtToken ?? ""});
  Future<Response> publisherSearch(String publisher) =>
      get("$host/api/books?publisher=$publisher",
          headers: {"Authorization": jwtToken ?? ""});
  Future<Response> categorySearch(String category) =>
      get("$host/api/books?category=$category",
          headers: {"Authorization": jwtToken ?? ""});
  Future<Response> categoryAndTitle(String category, String title) =>
      get("$host/api/books?category=$category&title=$title",
          headers: {"Authorization": jwtToken ?? ""});
  Future<Response> categoryAndAuthor(String category, String author) =>
      get("$host/api/books?category=$category&author=$author",
          headers: {"Authorization": jwtToken ?? ""});
  Future<Response> categoryAndPublisher(String category, String publisher) =>
      get("$host/api/books?category=$category&publisher=$publisher",
          headers: {"Authorization": jwtToken ?? ""});
}
