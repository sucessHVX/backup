class BookRespDto {
  final String? title;
  final String? category;
  final String? author;
  final String? publisher;
  final int? issueYear;
  final String? isbn;

  BookRespDto({
    this.title,
    this.category,
    this.author,
    this.publisher,
    this.issueYear,
    this.isbn,
  });

  //통신을 위해서 json 처럼 생긴 문자열 {"id": 1} => 다트 오브젝트로
  BookRespDto.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        category = json["category"],
        author = json["author"],
        publisher = json["publisher"],
        issueYear = json["issueYear"],
        isbn = json["isbn"];
}
