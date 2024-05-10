class InvalidFormException implements Exception {
  String message;
  InvalidFormException({this.message = 'Please check form errors'});
}
