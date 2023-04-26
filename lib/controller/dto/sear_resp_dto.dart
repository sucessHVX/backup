class SearRespDto {
  final String? username;
  final String? password;
  final String? name;

  SearRespDto(this.username, this.password, this.name);

  Map<String, dynamic> toJson() => {
        "username": username,
        "name": name,
        "password": password,
      };
}
