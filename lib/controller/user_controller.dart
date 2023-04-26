import 'package:get/get.dart';
import 'package:wihaoh/domain/user/user.dart';
import 'package:wihaoh/domain/user/user_repository.dart';
import 'package:wihaoh/util/clear.dart';
import 'package:wihaoh/util/jwt.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; //UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트
  final principal = User().obs;
  final joins = <User>[].obs;

  void logout() {
    isLogin.value = false;
    jwtToken = null;
    loginClear();
  }

  Future<int> login(String username, String password) async {
    User principal = await _userRepository.login(username, password);

    if (principal.username != null) {
      isLogin.value = true;
      this.principal.value = principal;
      return 1;
    } else {
      return -1;
    }
  }

  Future<int> join(String username, String password, String name) async {
    int result = await _userRepository.join(username, password, name);

    if (result == 1) {
      return 1;
    } else {
      return -1;
    }
  }
}
