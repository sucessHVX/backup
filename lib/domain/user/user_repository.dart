import 'package:get/get_connect/http/src/response/response.dart';
import 'package:wihaoh/controller/dto/info_resp_dto.dart';
import 'package:wihaoh/controller/dto/join_req_dto.dart';
import 'package:wihaoh/controller/dto/login_req_dto.dart';
import 'package:wihaoh/controller/dto/user_resp_dto.dart';
import 'package:wihaoh/domain/user/user.dart';
import 'package:wihaoh/domain/user/user_provider.dart';
import 'package:wihaoh/util/jwt.dart';

//통신을 호출해서 응답되는 데이터 가공(json 형식으로 들어오니 dart 오브젝트로)
class UserRepository {
  // _ 언더바를 변수 앞에 쓰면 private됨
  final UserProvider _userProvider = UserProvider();

  Future<User> loginRepository(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    //.toJson을 통해 map으로 변경
    Response response = await _userProvider.loginProvider(loginReqDto.toJson());
    dynamic body = response.body;
    UserRespDto userRespDto = UserRespDto.fromJson(body);

    if (body["jwt"] != null) {
      User principal = User.fromJson(userRespDto.data);
      String token = body["jwt"];
      jwtToken = token;
      return principal;
    } else {
      return User();
    }
  }

  Future<InfoRespDto> userRepository() async {
    Response response = await _userProvider.userProvider();
    dynamic body = response.body;
    print(body);
    InfoRespDto princ = InfoRespDto.fromJson(body);
    return princ;
  }

  Future<int> joinRepository(
      String username, String password, String name) async {
    JoinReqDto joinReqDto = JoinReqDto(username, password, name);
    //.toJson을 통해 map으로 변경
    Response response = await _userProvider.joinProvider(joinReqDto.toJson());
    if (response.isOk == true) {
      return 1;
    } else {
      return -1;
    }
  }
}
