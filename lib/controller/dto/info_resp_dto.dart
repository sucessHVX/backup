import 'package:wihaoh/controller/dto/loan_resp_dto.dart';

class InfoRespDto {
  final String? name;
  final String? username;
  final LoanRespDto? loan;

  InfoRespDto({
    this.username,
    this.name,
    this.loan,
  });

  //통신을 위해서 json 처럼 생긴 문자열 {"id": 1} => 다트 오브젝트로
  InfoRespDto.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        name = json["name"],
        loan = json["loans"].isEmpty
            ? null
            : LoanRespDto.fromJson(json["loans"][0]);
}
