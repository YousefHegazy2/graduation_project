import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentora_app/features/login_and_signup/cubit/setnewpassword_cubit.dart';
import 'package:rentora_app/features/login_and_signup/widgets/set_new_password_screen.dart';

class SetNewPassword extends StatelessWidget {
  const SetNewPassword({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => SetnewpasswordCubit(),
          child: const SetNewPasswordScreen(),
        ),
      ),
    );
  }
}


