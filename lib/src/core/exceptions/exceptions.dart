class CustomException implements Exception {
  final String? message;

  CustomException([this.message]);
}

class GeneralException extends CustomException {
  @override
  String? get message => "something went wrong";
}

class ServerException implements CustomException {
  // ignore: prefer_final_fields
  String? _message = "server_exception";

  ServerException([this._message]);

  @override
  String? get message => _message;
}

class FirebaseCustomException implements CustomException {
  FirebaseCustomException([String? message]) {
    _message = message;
  }

  String? _message = "firebase_exception";
  @override
  String? get message => _message;
}
