import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentora_app/features/login_and_signup/cubit/signupdetails_cubit.dart';
import 'package:rentora_app/features/login_and_signup/widgets/signup_details_screen_body.dart';

class SignupDetails extends StatelessWidget {
  const SignupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => SignupdetailsCubit(),
          child: SignUpDetailsBody(),
        ),
      ),
    );
  }
}


