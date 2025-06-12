import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rentora_app/cores/params/login_params.dart';
import 'package:rentora_app/features/login_and_signup/repositery/login_and_sinup_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginAndSinupRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login(LoginParams loginParams) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());

      loginRepo.login(loginParams).then((value) {
        value.fold(
          (failure) => emit(LoginFailure(error: failure.errMessage)),
          (loginResponse) {
            if (loginResponse.succeeded == false) {
              emit(LoginFailure(error: loginResponse.message));
            } else {
              emit(LoginSuccess(massage: loginResponse.message));
            }
          },
        );
      });
    }
  }


}
