import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentora_app/cores/params/sinup_params.dart';
import 'package:rentora_app/cores/widgets/Custom_Row_Dropdown.dart';
import 'package:rentora_app/features/login_and_signup/cubit/sinup_cubit.dart';
import 'package:rentora_app/features/login_and_signup/views/pin_code_screen.dart';
import 'package:rentora_app/features/login_and_signup/widgets/arrow_back.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_button.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_text_textfield.dart';
import 'package:rentora_app/features/login_and_signup/widgets/image_upload_field.dart';
import 'package:rentora_app/features/login_and_signup/widgets/main_text.dart';
import 'package:rentora_app/features/login_and_signup/widgets/national_id%20_textfield.dart';

class SignUpDetailsBody extends StatelessWidget {
  const SignUpDetailsBody({
    super.key,
    required this.name,
    required this.email,
    required this.password,
  });
  final String name;
  final String email;
  final String password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SinupCubit, SinupState>(
      listener: (context, state) {
     if (state is SinupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.massage)),
          );
        } else if (state is SinupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
       
            SnackBar(content: Text(state.error, style: TextStyle(color: Colors.white))),
          );
       
     }
      },
      builder: (context, state) {
        return Form(
          key: context.read<SinupCubit>().formKey2,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
                    child: Row(children: [
                      MainText(
                        text: 'Personal Details',
                        fontsize: 30,
                        color: Colors.black,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      ArrowBack(),
                    ]),
                  ),
                  SizedBox(height: 10),
                  Form(
                      key: context.read<SinupCubit>().formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextfield(
                            controller:
                                context.read<SinupCubit>().firstnameController,
                            labeltext: 'First Name',
                          ),
                          SizedBox(height: 15),
                          CustomTextfield(
                            controller:
                                context.read<SinupCubit>().lastnameController,
                            labeltext: 'Last Name',
                          ),
                          SizedBox(height: 15),
                          NationalIdTextField(
                            controller:
                                context.read<SinupCubit>().nationalidController,
                            labeltext: 'National ID',
                          ),
                          SizedBox(height: 15),
                          CustomTextfield(
                            controller: context
                                .read<SinupCubit>()
                                .personalsammaryController,
                            labeltext: 'Personal summary (optional)',
                          ),
                          SizedBox(height: 20),
                          const MainText(
                            text: 'Contact details',
                            fontsize: 30,
                            color: Colors.black,
                          ),
                          SizedBox(height: 15),
                          CustomTextfield(
                            controller:
                                context.read<SinupCubit>().phoneController,
                            hinttext: 'Phone number',
                          ),
                          SizedBox(height: 15),
                          ImageUploadField(
                              hinttext: 'Browse front side of ID card '),
                          SizedBox(height: 15),
                          ImageUploadField(
                              hinttext: 'Browse back side of ID card '),
                          SizedBox(height: 15),
                          const MainText(
                            text: 'Personal address',
                            fontsize: 30,
                            color: Colors.black,
                          ),
                          SizedBox(height: 5),
                          CustomRowDropdown(text3: 'Governerate', text4: 'Town'),
                          SizedBox(height: 15),
                          CustomTextfield(
                            controller:
                                context.read<SinupCubit>().addresscontroller,
                            hinttext: 'Address',
                          ),
                          SizedBox(height: 15),
                          Center(
                              child: CustomButton(
                            buttonName: 'Sign up',
                            onpressed: () {
                              context.read<SinupCubit>().sinup(
                                    SignupParams(
                                      profileImage: 'sss',
                                      idImageFront: 'ddddd',
                                      idImageBack: 'idImageBack',
                                      firstName: context
                                          .read<SinupCubit>()
                                          .firstnameController
                                          .text,
                                      lastName: context
                                          .read<SinupCubit>()
                                          .lastnameController
                                          .text,
                                      userName: name,
                                      emailConfirmed: email,
                                      password: password,
                                      nationalID: context
                                          .read<SinupCubit>()
                                          .nationalidController
                                          .text,
                                      personalSummary: context
                                          .read<SinupCubit>()
                                          .personalsammaryController
                                          .text,
                                      phoneNumber: context
                                          .read<SinupCubit>()
                                          .phoneController
                                          .text,
                                      governorate: '',
                                      town: 'own',
                                      address: context
                                          .read<SinupCubit>()
                                          .addresscontroller
                                          .text,
                                    ),
                                  );
                            },
                          )),
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
