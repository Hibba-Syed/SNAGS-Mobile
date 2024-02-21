class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException( [this._message, this._prefix]);

  @override
  String toString() {
    return "${_prefix??''}$_message";
  }
}

// This exception is for API timeout
class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(message);
}

// This exception is for invalid API url
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message);
}

// This exception is for unauthorised tokens
class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message);
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message);
}

class NotFoundException extends AppException {
  NotFoundException([String? message, String? prefix]): super(message,prefix);
}

class QuantityNotFoundException extends AppException{
  QuantityNotFoundException([String? message, String? prefix]) : super(message,prefix);
}
