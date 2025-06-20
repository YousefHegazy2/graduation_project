import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentora_app/cores/databases/api/dio_consumer.dart';
import 'package:rentora_app/features/login_and_signup/cubit/sinup_cubit.dart';
import 'package:rentora_app/features/login_and_signup/repositery/login_and_sinup_repo.dart';
import 'package:rentora_app/features/login_and_signup/widgets/sinup_screen_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            SinupCubit(LoginAndSinupRepo(DioConsumer(dio: Dio()))),
        child: Scaffold(
          body:  SinupScreenBody(),
        ),
      ),
    );
  }
}
