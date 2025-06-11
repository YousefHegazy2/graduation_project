import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rentora_app/cores/databases/api/api_consumer.dart';
import 'package:rentora_app/cores/databases/api/endpoints.dart';
import 'package:rentora_app/cores/errors/expentions.dart';
import 'package:rentora_app/cores/errors/failure.dart';
import 'package:rentora_app/cores/params/sinup_params.dart';
import 'package:rentora_app/features/login_and_signup/model/login_and_sinup_model.dart';

class LoginAndSinupRepo {
  final ApiConsumer apiConsumer;
  LoginAndSinupRepo(this.apiConsumer);


  Future<Either<Failure, LoginResponse>> sinup(SignupParams signupParams) async {
    try {
      final data =FormData.fromMap({
    'ProfileImage': signupParams.profileImage,
    'IDImageFront': signupParams.idImageFront,
    'IDImageBack': signupParams.idImageBack,
    'FirstName': signupParams.firstName,
    'LastName': signupParams.lastName,
    'UserName': signupParams.userName,
    'EmailConfirmed': signupParams.emailConfirmed,
    'Password': signupParams.password,
    'NationalID': signupParams.nationalID,
    'Personal_summary': signupParams.personalSummary,
    'PhoneNumber': signupParams.phoneNumber,
    'Governorate': signupParams.governorate,
    'Town': signupParams.town,
    'Address': signupParams.address, }
      );
  final response =
      await apiConsumer.post(
        
        path: Endpoints.sinup , 
        isFormData: true
        ,data: data);
return response.fold(
  (l) => Left(Failure(errMessage: l)),
  (r) => Right(LoginResponse.fromJson(r.data)),
);
 
}  on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
  
}
}
