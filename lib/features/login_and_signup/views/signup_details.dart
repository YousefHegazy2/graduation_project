import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rentora_app/cores/databases/api/dio_consumer.dart';
import 'package:rentora_app/features/login_and_signup/cubit/sinup_cubit.dart';
import 'package:rentora_app/features/login_and_signup/repositery/login_and_sinup_repo.dart';
import 'package:rentora_app/features/login_and_signup/widgets/signup_details_screen_body.dart';

class SignupDetails extends StatelessWidget {
  const SignupDetails(
      {super.key,
      required this.name,
      required this.email,
      required this.password});
  final String name;
  final String email;
  final String password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
            create: (context) =>
                SinupCubit(LoginAndSinupRepo(DioConsumer(dio: Dio()))),
            child: BlocBuilder<SinupCubit, SinupState>(
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is SinupLoading,
                  child: SignUpDetailsBody(
                      name: name, email: email, password: password),
                );
              },
            )),
      ),
    );
  }
}
