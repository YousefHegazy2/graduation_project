class SignupParams {
  final String profileImage;
  final String idImageFront;
  final String idImageBack;
  final String firstName;
  final String lastName;
  final String userName;
  final String emailConfirmed;
  final String password;
  final String nationalID;
  final String personalSummary;
  final String phoneNumber;
  final String governorate;
  final String town;
  final String address;

  SignupParams({
    required this.profileImage,
    required this.idImageFront,
    required this.idImageBack,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.emailConfirmed,
    required this.password,
    required this.nationalID,
    required this.personalSummary,
    required this.phoneNumber,
    required this.governorate,
    required this.town,
    required this.address,
  });
}
