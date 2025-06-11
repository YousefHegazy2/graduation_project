class LoginResponse {
  final int statusCode;
  final dynamic meta;
  final bool succeeded;
  final String message;
  final Map<String, List<String>>? errors;
  final dynamic data;

  LoginResponse({
    required this.statusCode,
    this.meta,
    required this.succeeded,
    required this.message,
    this.errors,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json['statusCode'] ?? json['StatusCode'] ?? 0,
      meta: json['meta'] ?? json['Meta'],
      succeeded: json['succeeded'] ?? json['Succeeded'] ?? false,
      message: json['message'] ?? json['Message'] ?? '',
      errors: (json['errors'] ?? json['Errors']) != null
          ? Map<String, List<String>>.from(
              (json['errors'] ?? json['Errors']).map(
                (key, value) => MapEntry(key.toString(), List<String>.from(value)),
              ),
            )
          : null,
      data: json['data'] ?? json['Data'],
    );
  }
}
