class LoginResponse {
  final int statusCode;
  final bool succeeded;
  final String message;
  final dynamic meta;
  final dynamic errors;
  final Data? data; // ممكن تكون null عند الفشل

  LoginResponse({
    required this.statusCode,
    required this.succeeded,
    required this.message,
    this.meta,
    this.errors,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json['statusCode'],
      succeeded: json['succeeded'],
      message: json['message'],
      meta: json['meta'],
      errors: json['errors'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'succeeded': succeeded,
      'message': message,
      'meta': meta,
      'errors': errors,
      'data': data?.toJson(), // null-safe
    };
  }
}

class Data {
  final String id;
  final String message;
  final bool isAuthenticated;
  final String username;
  final String email;
  final List<String> roles;
  final String token;
  final String expireOn;
  final String profileImage;
  final bool emailConfirmed;

  Data({
    required this.id,
    required this.message,
    required this.isAuthenticated,
    required this.username,
    required this.email,
    required this.roles,
    required this.token,
    required this.expireOn,
    required this.profileImage,
    required this.emailConfirmed,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      message: json['message'],
      isAuthenticated: json['isAuthinticated'],
      username: json['username'],
      email: json['email'],
      roles: List<String>.from(json['roles']),
      token: json['token'],
      expireOn: json['expireOn'],
      profileImage: json['profileImage'],
      emailConfirmed: json['emailConfirmed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'isAuthinticated': isAuthenticated,
      'username': username,
      'email': email,
      'roles': roles,
      'token': token,
      'expireOn': expireOn,
      'profileImage': profileImage,
      'emailConfirmed': emailConfirmed,
    };
  }
}