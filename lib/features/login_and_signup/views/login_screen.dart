import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentora_app/cores/databases/api/dio_consumer.dart';
import 'package:rentora_app/features/login_and_signup/cubit/login_cubit.dart';
import 'package:rentora_app/features/login_and_signup/repositery/login_and_sinup_repo.dart';
import 'package:rentora_app/features/login_and_signup/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) =>
              LoginCubit(LoginAndSinupRepo(DioConsumer(dio: Dio()))),
          child: loginscreenbody(),
        ),
      ),
    );
  }
}

