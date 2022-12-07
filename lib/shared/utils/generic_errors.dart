class GenericError extends Error {
  GenericError(this.message);

  final String message;
  @override
  String toString() {
    return message;
  }
}
