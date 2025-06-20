import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentora_app/cores/databases/cache/cache_helper.dart';
import 'package:rentora_app/cores/params/login_params.dart';
import 'package:rentora_app/cores/vaildators/validator.dart';
import 'package:rentora_app/features/Home/views/HomePage.dart';
import 'package:rentora_app/features/login_and_signup/cubit/login_cubit.dart';
import 'package:rentora_app/features/login_and_signup/views/forget_password_screen.dart';
import 'package:rentora_app/features/login_and_signup/views/signup_screen.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_button.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_password_textfield.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_text.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_text_textfield.dart';
import 'package:rentora_app/features/login_and_signup/widgets/google_icon.dart';
import 'package:rentora_app/features/login_and_signup/widgets/image_upload_field.dart';
import 'package:rentora_app/features/login_and_signup/widgets/left_top_image.dart';
import 'package:rentora_app/features/login_and_signup/widgets/main_text.dart';

class loginscreenbody extends StatelessWidget {
  const loginscreenbody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          CacheHelper.sharedPreferences
              .setString('token', state.massage.data!.token);
          final token = CacheHelper.sharedPreferences.getString('token');
          print('Token: $token');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(),
            ),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text(state.error, style: TextStyle(color: Colors.white))),
          );
        }
      },
      child: SingleChildScrollView(
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
                      validator: (value) => Validator.validateEmail(value),
                      hinttext: 'example@gmail.com',
                      controller: context.read<LoginCubit>().emailController,
                    ),

                    SizedBox(height: 15),

                    // *************  the second text field for ( Password )
                    const CustomText(text: 'Password'),
                    CustomPasswordTextfield(
                      hinttext: 'Enter your password',
                      validator: (value) => Validator.validatePassword(value),
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
                    SizedBox(height: 15),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return state is LoginFailure
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: Text(state.error,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.red)),
                              )
                            : Container();
                      },
                    ),
                    const SizedBox(height: 15),

                    //  ******************   the Login button
                    CustomButton(
                      buttonName: 'Login',
                      onpressed: () {
                        context.read<LoginCubit>().login(
                              LoginParams(
                                email: context
                                    .read<LoginCubit>()
                                    .emailController
                                    .text,
                                password: context
                                    .read<LoginCubit>()
                                    .passwordController
                                    .text,
                              ),
                            );
                        context.read<LoginCubit>().emailController.clear();
                        context.read<LoginCubit>().passwordController.clear();
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
      ),
    );
  }
}
