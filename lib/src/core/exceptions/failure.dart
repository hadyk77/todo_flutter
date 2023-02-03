class Failure implements Exception {
  final dynamic message;
  final int? code;
  Map<String, dynamic>? messageArray;
  Failure({this.message, this.messageArray, this.code});

  @override
  String toString() {
    Object message = this.message;

    return "Exception: $message";
  }
}

class ServerFailure extends Failure {
  ServerFailure([String? message])
      : super(message: message ?? "server_exception", code: 500);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(
      {String? message, Map<String, dynamic>? messageArray, int? code})
      : super(
          message: message ?? "firebase_exception",
          code: code ?? 500,
        );
}
