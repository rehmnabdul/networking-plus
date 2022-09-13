import 'dart:convert';

class ApiResponse<T> {}

class Success<T> extends ApiResponse<T> {
  late dynamic response;

  Success(String? body) {
    if (body == null) response = null;
    try {
      response = jsonDecode(body!);
    } on FormatException catch (e) {
      response = body!;
    }
  }
}

class Error<T> extends ApiResponse<T> {
  int code;
  String message;

  Error(this.code, this.message);
}
