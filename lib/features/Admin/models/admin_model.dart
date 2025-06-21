class AdminModel {
  final String username;
  final String email;

  AdminModel({required this.username, required this.email});

  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      AdminModel(username: json['username'], email: json['email']);
}
