import 'package:wihaoh/controller/dto/loan_resp_dto.dart';

class InfoRespDto {
  final String? name;
  final String? username;
  final List<LoanRespDto>? loans;

  InfoRespDto({
    this.username,
    this.name,
    this.loans,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id": 1} => 다트 오브젝트로
  InfoRespDto.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        name = json["name"],
        loans = json["loans"] != null
            ? List<LoanRespDto>.from(
                json["loans"].map((item) => LoanRespDto.fromJson(item)))
            : null;
}
