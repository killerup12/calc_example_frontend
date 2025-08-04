class Failure {
  final String message;
  final int? statusCode;
  final dynamic error;

  const Failure({
    required this.message,
    this.statusCode,
    this.error,
  });

  @override
  String toString() => 'Failure(message: $message, statusCode: $statusCode, error: $error)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    
    return other is Failure &&
      other.message == message &&
      other.statusCode == statusCode &&
      other.error == error;
  }

  @override
  int get hashCode => message.hashCode ^ statusCode.hashCode ^ error.hashCode;
}
