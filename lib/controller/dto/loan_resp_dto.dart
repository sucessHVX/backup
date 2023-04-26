import 'package:intl/intl.dart';

class LoanRespDto {
  final DateTime? borrowDate;
  final DateTime? returnDate;
  final dynamic book;

  LoanRespDto({
    this.borrowDate,
    this.returnDate,
    this.book,
  });

  //통신을 위해서 json 처럼 생긴 문자열 {"id": 1} => 다트 오브젝트로
  LoanRespDto.fromJson(Map<String, dynamic> json)
      : borrowDate = DateFormat("yyyy-mm-dd").parse(json["borrowDate"]),
        returnDate = DateFormat("yyyy-mm-dd").parse(json["returnDate"]),
        book = json["bookResponseDto"];
}
