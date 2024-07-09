// ignore_for_file: camel_case_types, constant_identifier_names

class httpStatusCodes {
//success
  static const int OK = 200;
  static const int ACCEPTED = 202;
  static const int NO_CONTENT = 204;
  static const int ALREADY_REPORTED = 208;

  //redirection
  static const int MULTIPLE_CHOICES = 300;

  //client errors
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORIZED = 401;
  static const int PAYMENT_REQUIRED = 402;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int METHOD_NOT_ALLOWED = 405;
  static const int REQUEST_TIME_OUT = 408;
  static const int CONFLICT = 409;
  static const int TOO_MANY_REQUESTS = 429;

//server errors
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int NOT_IMPLEMENTED = 501;
  static const int BAD_GATEWAY = 502;
  static const int SERVER_UNREACHABLE = 503;
  static const int GATEWAY_TIMEOUT = 504;

  static const int CREATED_SUCCESSFULLY = 201;

  static const int NO_INTERNET = 509;
}
