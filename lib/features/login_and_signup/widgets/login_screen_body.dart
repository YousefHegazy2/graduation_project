import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentora_app/features/login_and_signup/cubit/login_cubit.dart';
import 'package:rentora_app/features/login_and_signup/views/forget_password_screen.dart';
import 'package:rentora_app/features/login_and_signup/views/signup_screen.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_button.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_password_textfield.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_text.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_text_textfield.dart';
import 'package:rentora_app/features/login_and_signup/widgets/google_icon.dart';
import 'package:rentora_app/features/login_and_signup/widgets/left_top_image.dart';
import 'package:rentora_app/features/login_and_signup/widgets/main_text.dart';

class loginscreenbody extends StatelessWidget {
  const loginscreenbody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          LeftTopImage(),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 125),
            child: Form(
              key: context.read<LoginCubit>().formKey,
              child: Column(
                children: [
                  // ************** welcome text at the top of the screen
                  const MainText(
                    text: 'Welcome Back!',
                    fontsize: 40,
                    color: Colors.black,
                  ),

                  SizedBox(height: 10),

                  // ************* the image in the screen
                  Image.asset('assets/images/login.png'),

                  SizedBox(height: 15),

                  // ************* the first text field for ( Email )
                  const CustomText(text: 'Email'),
                  CustomTextfield(
                    hinttext: 'example@gmail.com',
                    controller: context.read<LoginCubit>().emailController,
                  ),

                  SizedBox(height: 15),

                  // *************  the second text field for ( Password )
                  const CustomText(text: 'Password'),
                  CustomPasswordTextfield(
                    hinttext: 'Enter your password',
                    obscureText: true,
                    sufixicon: Icon(Icons.remove_red_eye_outlined),
                    controller: context.read<LoginCubit>().passwordController,
                  ),

                  SizedBox(height: 5),

                  //  ***************  the forget password text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ForgetPasswordScreen();
                            },
                          ));
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  //  ******************   the Login button
                  CustomButton(
                    buttonName: 'Login',
                    onpressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ForgetPasswordScreen();
                        },
                      ));
                    },
                  ),
                  const SizedBox(height: 15),

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
                        'Don\'t have an account? ',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return SignupScreen();
                            },
                          ));
                        },
                        child: const Text(
                          ' Sign up',
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
