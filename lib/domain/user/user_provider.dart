import 'package:get/get.dart';
import 'package:wihaoh/util/jwt.dart';

const host = "http://3.35.89.120:8080";

//통신 역할
class UserProvider extends GetConnect {
  //Map타입으로 전송을 해줘야 함 post방식으로
  Future<Response> loginProvider(Map data) => post("$host/login", data);
  Future<Response> joinProvider(Map data) => post("$host/sign", data);
  Future<Response> userProvider() =>
      get("$host/api/users", headers: {"Authorization": jwtToken ?? ""});
}
