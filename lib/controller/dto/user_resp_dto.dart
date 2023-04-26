class UserRespDto {
  final int? id;
  final dynamic data;

  UserRespDto({
    this.id,
    this.data,
  });

  //통신을 위해서 json 처럼 생긴 문자열 {"id": 1} => 다트 오브젝트로
  UserRespDto.fromJson(Map<String, dynamic> json)
      : id = json["userId"],
        data = json["userResponseDto"];
}
