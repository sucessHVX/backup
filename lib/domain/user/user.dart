class User {
  final String? name;
  final String? username;
  final dynamic loans;

  User({
    this.username,
    this.name,
    this.loans,
  });

  //통신을 위해서 json 처럼 생긴 문자열 {"id": 1} => 다트 오브젝트로
  User.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        name = json["name"],
        loans = json["loans"];
}
