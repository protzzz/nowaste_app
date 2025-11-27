class ApiException {
  final String message;
  final int statusCode;
  final Uri? uri;

  ApiException(this.message, {this.statusCode = -1, this.uri});

  @override
  String toString() => '$message ($statusCode)';
}
