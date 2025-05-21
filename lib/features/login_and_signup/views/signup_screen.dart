import 'package:flutter/material.dart';
import 'package:rentora_app/features/login_and_signup/views/login_screen.dart';
import 'package:rentora_app/features/login_and_signup/views/pin_code_screen.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_button.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_password_textfield.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_text.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_text_textfield.dart';
import 'package:rentora_app/features/login_and_signup/widgets/google_icon.dart';
import 'package:rentora_app/features/login_and_signup/widgets/left_top_image.dart';
import 'package:rentora_app/features/login_and_signup/widgets/main_text.dart';
import 'package:rentora_app/features/login_and_signup/widgets/terms_and_conditions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            LeftTopImage(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 125),
              child: Column(
                children: [
                  const MainText(
                    text: 'Create Account',
                    fontsize: 40,
                    color: Colors.black,
                  ),

                  SizedBox(height: 10),

                  // ************* the image in the screen
                  Image.asset('assets/images/sign up.png'),

                  SizedBox(height: 5),

                  //  ***************  the textfield for name
                  CustomText(text: 'Name'),
                  CustomTextfield(
                    hinttext: 'Enter your name',
                    controller: TextEditingController(),
                  ),

                  SizedBox(height: 10),

                  //  ******************    the textfield for email
                  CustomText(text: 'Email'),
                  CustomTextfield(
                    hinttext: 'example@gmail.com',
                    controller: TextEditingController(),
                  ),

                  SizedBox(height: 10),

                  //  ****************    the textfield for password
                  CustomText(text: 'Password'),
                  CustomPasswordTextfield(
                    hinttext: '. . . . . . . . . . . .',
                    obscureText: true,
                    controller: TextEditingController(),
                  ),

                  //  **************    the terms and conditions row
                  const TermsAndConditions(),

                  //  ******************   the Login button
                  CustomButton(
                    buttonName: 'Sign up',
                    onpressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return PinCodeScreen('');
                        },
                      ));
                    },
                  ),
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
                              return LoginScreen();
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
            )
          ],
        ),
      ),
    );
  }
}
