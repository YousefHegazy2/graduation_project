import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rentora_app/cores/params/sinup_params.dart';
import 'package:rentora_app/features/login_and_signup/repositery/login_and_sinup_repo.dart';

part 'sinup_state.dart';

class SinupCubit extends Cubit<SinupState> {
  final LoginAndSinupRepo loginAndSinupRepo;
  SinupCubit(this.loginAndSinupRepo) : super(SinupInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();





  Future<void> sinup(SignupParams signupParams) async {
    if (formKey.currentState!.validate()) {
      emit(SinupLoading());

      loginAndSinupRepo.sinup(signupParams).then((value) {
        value.fold(
          (failure) => emit(SinupFailure(error: failure.errMessage)),


          (loginResponse) {
            if (loginResponse.succeeded == false) {
              emit(SinupFailure(error: loginResponse.message));
            }else {
              emit(SinupSuccess(massage: loginResponse.message));
            }
          },
        );
      });
    }
  }
}
