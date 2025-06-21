import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentora_app/features/login_and_signup/cubit/setnewpassword_cubit.dart';
import 'package:rentora_app/features/login_and_signup/views/login_screen.dart';
import 'package:rentora_app/features/login_and_signup/widgets/arrow_back.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_button.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_password_textfield.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_text.dart';
import 'package:rentora_app/features/login_and_signup/widgets/left_top_image.dart';
import 'package:rentora_app/features/login_and_signup/widgets/main_text.dart';
import 'package:rentora_app/features/login_and_signup/widgets/secondary_text.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 40,
          right: 10,
          child: ArrowBack(),
        ),
        LeftTopImage(),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 120),
          child: Column(
            children: [
              Image.asset('assets/images/set new password.png'),

              const SizedBox(height: 30),

              //   ************    the main text
              const MainText(
                text: 'Set new Password',
                fontsize: 30,
                color: Colors.black,
              ),

              //   *************  the text uder the main text
              const SecondaryText(text: 'Please enter a new password'),

              const SizedBox(height: 30),

              Form(
                key: context.read<SetnewpasswordCubit>().formKey,
                child: Column(
                  children: [
                    //  ***************  the password textfield

                    const CustomText(text: 'Password'),
                    CustomPasswordTextfield(
                      hinttext: '. . . . . . . . . . .',
                      obscureText: true,
                      sufixicon: const Icon(Icons.remove_red_eye_outlined),
                      controller: context
                          .read<SetnewpasswordCubit>()
                          .passwordController,
                    ),
                    const SizedBox(height: 30),

                    //  ***************  the confirm password textfield

                    const CustomText(text: 'Confirm Password'),
                    CustomPasswordTextfield(
                      hinttext: '. . . . . . . . . . .',
                      obscureText: true,
                      sufixicon: const Icon(Icons.remove_red_eye_outlined),
                      controller: context
                          .read<SetnewpasswordCubit>()
                          .confirmedpasswordcontroller,
                    ),
                    const SizedBox(height: 50),

                    //  ***************  the submit password button

                    CustomButton(
                      buttonName: 'Submit password',
                      fontsize: 18,
                      onpressed: () {
                        if (context
                                .read<SetnewpasswordCubit>()
                                .passwordController
                                .text
                                .isEmpty ||
                            context
                                .read<SetnewpasswordCubit>()
                                .confirmedpasswordcontroller
                                .text
                                .isEmpty) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.bottomSlide,
                            desc: 'Please enter both passwords!',
                            descTextStyle: const TextStyle(fontSize: 25),
                            btnOkColor: Colors.orange,
                            btnOkOnPress: () {},
                          ).show();
                          return;
                        } else if (context
                                .read<SetnewpasswordCubit>()
                                .passwordController
                                .text ==
                            context
                                .read<SetnewpasswordCubit>()
                                .confirmedpasswordcontroller
                                .text) {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.bottomSlide,
                            customHeader: Image.asset(
                              'assets/images/succes.png',
                              height: 120,
                            ),
                            title: '',
                            desc: 'Password Recovery Successful',
                            descTextStyle: const TextStyle(fontSize: 30),
                            btnOkText: 'Return to login',
                            btnOkColor: Colors.blue,
                            btnOkOnPress: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                          ).show();
                        } else {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.bottomSlide,
                            desc: 'Passwords do not match!',
                            descTextStyle: const TextStyle(fontSize: 25),
                            btnOkColor: Colors.red,
                            btnOkOnPress: () {},
                          ).show();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
