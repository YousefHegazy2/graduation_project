class LoginData {
  final String id;
  final String message;
  final bool isAuthenticated;
  final String username;
  final String email;
  final List<String> roles;
  final String token;
  final DateTime expireOn;
  final String profileImage;
  final bool emailConfirmed;

  LoginData({
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

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      id: json['id'],
      message: json['message'],
      isAuthenticated: json[
          'isAuthinticated'], // Note: keep the typo if it exists in the API
      username: json['username'],
      email: json['email'],
      roles: List<String>.from(json['roles']),
      token: json['token'],
      expireOn: DateTime.parse(json['expireOn']),
      profileImage: json['profileImage'],
      emailConfirmed: json['emailConfirmed'],
    );
  }
}

class LoginModel {
  final int statusCode;
  final bool succeeded;
  final String message;
  final LoginData? data;

  LoginModel({
    required this.statusCode,
    required this.succeeded,
    required this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      statusCode: json['statusCode'],
      succeeded: json['succeeded'],
      message: json['message'],
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
    );
  }
}
