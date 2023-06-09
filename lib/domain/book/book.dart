class Book {
  final String? title;
  final String? category;
  final String? author;
  final String? publisher;
  final int? issueYear;
  final String? isbn;
  final String imgUrl;

  Book({
    this.title,
    this.category,
    this.author,
    this.publisher,
    this.issueYear,
    this.isbn,
    required this.imgUrl,
  });

  //통신을 위해서 json 처럼 생긴 문자열 {"id": 1} => 다트 오브젝트로
  Book.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        category = json["category"],
        author = json["author"],
        publisher = json["publisher"],
        issueYear = json["issueYear"],
        isbn = json["isbn"],
        imgUrl = json["imgUrl"];
}
