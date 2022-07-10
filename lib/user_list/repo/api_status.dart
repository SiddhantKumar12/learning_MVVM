class Success {
  int? code;
  Object? response;
  Success({this.response, this.code});
}

class Failure {
  int? code;
  Object? errorResponse;
  Failure({this.errorResponse, this.code});
}
