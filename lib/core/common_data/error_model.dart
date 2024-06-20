import 'dart:convert';

class ErrorResponse {
  final int? statusCode;
  final String? timestamp;
  final String? message;
  final String? description;

  ErrorResponse({
    this.statusCode,
    this.timestamp,
    this.message,
    this.description,
  });

  factory ErrorResponse.fromJson(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return ErrorResponse(
      statusCode: jsonMap['statusCode'],
      timestamp: jsonMap['timestamp'],
      message: jsonMap['message'],
      description: jsonMap['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'timestamp': timestamp,
        'message': message,
        'description': description,
      };

  ErrorResponse copyWith({
    int? statusCode,
    String? timestamp,
    String? message,
    String? description,
  }) {
    return ErrorResponse(
      statusCode: statusCode ?? this.statusCode,
      timestamp: timestamp ?? this.timestamp,
      message: message ?? this.message,
      description: description ?? this.description,
    );
  }
}
