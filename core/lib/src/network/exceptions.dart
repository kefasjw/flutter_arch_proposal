class HttpStatusCodeException implements Exception {
  HttpStatusCodeException(this.statusCode);

  final int statusCode;

  @override
  String toString() {
    return 'HttpStatusCodeException: $statusCode';
  }
}
