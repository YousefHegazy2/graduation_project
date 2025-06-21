import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentora_app/cores/vaildators/validator.dart';
import 'package:rentora_app/features/login_and_signup/cubit/sinup_cubit.dart';
import 'package:rentora_app/features/login_and_signup/views/login_screen.dart';
import 'package:rentora_app/features/login_and_signup/views/signup_details.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_button.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_password_textfield.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_text.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_text_textfield.dart';
import 'package:rentora_app/features/login_and_signup/widgets/google_icon.dart';
import 'package:rentora_app/features/login_and_signup/widgets/left_top_image.dart';
import 'package:rentora_app/features/login_and_signup/widgets/main_text.dart';
import 'package:rentora_app/features/login_and_signup/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';

class SinupScreenBody extends StatelessWidget {
  SinupScreenBody({
    super.key,
  });
  late BuildContext context2;
  @override
  Widget build(BuildContext context) {
    context2 = context;
    return SingleChildScrollView(
      child: Stack(
        children: [
          const LeftTopImage(),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 105),
            child: Form(
              key: context.read<SinupCubit>().formKey,
              child: Column(
                children: [
                  const MainText(
                    text: 'Create Account',
                    fontsize: 40,
                    color: Colors.black,
                  ),

                  const SizedBox(height: 10),

                  // ************* the image in the screen
                  Image.asset('assets/images/sign up.png'),

                  const SizedBox(height: 5),

                  //  ***************  the textfield for name
                  const CustomText(text: 'Name'),
                  CustomTextfield(
                    validator: (value) => Validator.validateUsername(value),
                    hinttext: 'Enter your name',
                    controller: context.read<SinupCubit>().nameController,
                  ),

                  const SizedBox(height: 10),

                  //  ******************    the textfield for email
                  const CustomText(text: 'Email'),
                  CustomTextfield(
                    validator: (v) => Validator.validateEmail(v),
                    hinttext: 'example@gmail.com',
                    controller: context.read<SinupCubit>().emailController,
                  ),

                  const SizedBox(height: 10),

                  //  ****************    the textfield for password
                  const CustomText(text: 'Password'),
                  CustomPasswordTextfield(
                    validator: (v) => Validator.validatePassword(v),
                    sufixicon: const Icon(Icons.visibility_off),
                    hinttext: 'Enter your password',
                    obscureText: true,
                    controller: context.read<SinupCubit>().passwordController,
                  ),

                  //  **************    the terms and conditions row
                  const TermsAndConditions(),

                  //  ******************   the Login button
                  CustomButton(
                      buttonName: 'Sign up',
                      onpressed: () {
                        if (context2
                            .read<SinupCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          Navigator.push(context2, MaterialPageRoute(
                            builder: (context2) {
                              return SignupDetails(
                                name: context
                                    .read<SinupCubit>()
                                    .nameController
                                    .text,
                                email: context
                                    .read<SinupCubit>()
                                    .emailController
                                    .text,
                                password: context
                                    .read<SinupCubit>()
                                    .passwordController
                                    .text,
                              );
                            },
                          ));
                        }
                      }),
                  const SizedBox(height: 5),

                  const Text(
                    'Or sign in with',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),

                  //   *****************  the google icon
                  const GoogleIcon(),

                  //  ********************  the Don't have an account? row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ));
                        },
                        child: const Text(
                          ' Login',
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
