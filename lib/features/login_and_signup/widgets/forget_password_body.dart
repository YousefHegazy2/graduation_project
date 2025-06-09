import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentora_app/features/login_and_signup/cubit/forgetpassword_cubit.dart';
import 'package:rentora_app/features/login_and_signup/views/set_new_password.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_button.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_text.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_text_textfield.dart';
import 'package:rentora_app/features/login_and_signup/widgets/left_top_image.dart';
import 'package:rentora_app/features/login_and_signup/widgets/main_text.dart';
import 'package:rentora_app/features/login_and_signup/widgets/secondary_text.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      LeftTopImage(),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 120),
        child: Form(
          key: context.read<ForgetpasswordCubit>().formKey,
          child: Column(
            children: [
              Image.asset('assets/images/forget password.png'),

              const SizedBox(height: 30),

              //  ***********   the main text
              const MainText(
                text: 'Forget Password',
                fontsize: 30,
                color: Colors.black,
              ),

              //   *************   the text under the main text
              const SecondaryText(
                  text: 'Please enter your email to fix this problem '),

              const SizedBox(height: 40),

              //  ************  the Email textfield
              const CustomText(text: 'Email'),
              CustomTextfield(
                hinttext: 'example@gmail.com',
                controller: context.read<ForgetpasswordCubit>().emailController,
              ),

              const SizedBox(height: 50),

              //  ************   the submit button
              CustomButton(
                buttonName: 'Submit',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SetNewPassword();
                    },
                  ));
                },
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
