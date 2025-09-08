// ignore_for_file: public_member_api_docs, sort_constructors_first
class Failure {
  final String message;
  const Failure([
    this.message = 'Sorry, an unexpected error has occurred. Please try again.',
  ]);

  @override
  String toString() => 'Failure(message: $message)';
}
