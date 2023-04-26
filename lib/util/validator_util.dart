import 'package:validators/validators.dart';

Function validateUsername() {
  return (value) {
    if (value.isEmpty) {
      return "공백을 채우세요";
    } else if (!isAlphanumeric(value)) {
      return "영문과 숫자로 입력하세요";
    } else if (value.length > 12) {
      return "ID 길이가 너무 깁니다";
    } else if (value.length < 4) {
      return "ID 길이가 너무 짧습니다";
    } else {
      return null;
    }
  };
}

Function validatePassword() {
  return (value) {
    if (value.isEmpty) {
      return "공백을 채우세요";
    } else if (value.length > 12) {
      return "PW 길이가 너무 깁니다";
    } else if (value.length < 4) {
      return "PW 길이가 너무 짧습니다";
    } else {
      return null;
    }
  };
}

Function validateName() {
  return (value) {
    if (value.isEmpty) {
      return "공백을 채우세요";
    } else {
      return null;
    }
  };
}

Function validateTitle() {
  return (value) {
    if (value.isEmpty) {
      return "공백을 채우세요";
    } else if (value.length > 30) {
      return "30자 이내로 작성하세요";
    } else {
      return null;
    }
  };
}

Function validateContent() {
  return (value) {
    if (value.isEmpty) {
      return "공백을 채우세요";
    } else if (value.length > 1000) {
      return "1000자 이내로 작성하세요";
    } else {
      return null;
    }
  };
}
