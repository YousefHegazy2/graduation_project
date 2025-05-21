import 'package:flutter/material.dart';
import 'package:rentora_app/cores/widgets/Custom_Row_Dropdown.dart';
import 'package:rentora_app/features/login_and_signup/widgets/arrow_back.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_button.dart';
import 'package:rentora_app/features/login_and_signup/widgets/custom_text_textfield.dart';
import 'package:rentora_app/features/login_and_signup/widgets/image_upload_field.dart';
import 'package:rentora_app/features/login_and_signup/widgets/main_text.dart';
import 'package:rentora_app/features/login_and_signup/widgets/national_id%20_textfield.dart';

class SignupDetails extends StatelessWidget {
  const SignupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.red,
            ),
            SizedBox(height: 10),
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextfield(
                  controller: TextEditingController(),
                  labeltext: 'First Name',
                ),
                SizedBox(height: 15),
                CustomTextfield(
                  controller: TextEditingController(),
                  labeltext: 'Last Name',
                ),
                SizedBox(height: 15),
                NationalIdTextField(
                  controller: TextEditingController(),
                  labeltext: 'National ID',
                ),
                SizedBox(height: 15),
                CustomTextfield(
                  controller: TextEditingController(),
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
                  controller: TextEditingController(),
                  hinttext: 'Phone number',
                ),
                SizedBox(height: 15),
                ImageUploadField(hinttext: 'Browse front side of ID card '),
                SizedBox(height: 15),
                ImageUploadField(hinttext: 'Browse back side of ID card '),
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
                  controller: TextEditingController(),
                  hinttext: 'Address',
                ),
                SizedBox(height: 15),
                Center(
                    child: CustomButton(
                  buttonName: 'Sign up',
                  onpressed: () {},
                )),
              ],
            )),
          ],
        ),
      ),
    ));
  }
}
