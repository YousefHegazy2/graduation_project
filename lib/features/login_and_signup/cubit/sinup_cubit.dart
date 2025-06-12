import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rentora_app/cores/params/sinup_params.dart';
import 'package:rentora_app/features/login_and_signup/repositery/login_and_sinup_repo.dart';

part 'sinup_state.dart';

class SinupCubit extends Cubit<SinupState> {
  final LoginAndSinupRepo loginAndSinupRepo;
  SinupCubit(this.loginAndSinupRepo) : super(SinupInitial());
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController nationalidController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController frontsideidController = TextEditingController();
  final TextEditingController backsideidController = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  TextEditingController personalsammaryController = TextEditingController();

  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> sinup(SignupParams signupParams) async {
    if (formKey2.currentState!.validate()) {
      emit(SinupLoading());

      loginAndSinupRepo.sinup(signupParams).then((value) {
        value.fold(
          (failure) => emit(SinupFailure(error: failure.errMessage)),
          (signupModel) {
            if (signupModel.succeeded == false) {
              emit(SinupFailure(error: signupModel.message));
            } else {
              emit(SinupSuccess(massage: signupModel.message));
            }
          },
        );
      });
    }
  }
}
