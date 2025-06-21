import 'dart:async';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rentora_app/features/login_and_signup/views/set_new_password.dart';
import 'package:rentora_app/features/login_and_signup/widgets/left_top_image.dart';

class PinCodeScreen extends StatefulWidget {
  final String phoneNumber;

  PinCodeScreen(this.phoneNumber);

  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  late StreamController<ErrorAnimationType> errorController;
  TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool hasError = false;
  String currentText = "";
  late String generatedPin;

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
    _generateNewPin(); // Generate the initial PIN when the screen loads
  }

  @override
  void dispose() {
    errorController.close();
    textEditingController.dispose();
    super.dispose();
  }

  void _generateNewPin() {
    final random = Random();
    setState(() {
      generatedPin =
          (random.nextInt(9000) + 1000).toString(); // Random 4-digit PIN
    });
    print(
        "New PIN generated: $generatedPin"); // Debug log (replace with actual SMS API)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        LeftTopImage(),
        GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            children: [
              Image.asset('assets/images/pin code.png'),
              const SizedBox(height: 20),
              const Text(
                'Phone Number Verification',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Enter the code sent to ",
                  style: const TextStyle(color: Colors.black54, fontSize: 15),
                  children: [
                    TextSpan(
                      text: widget.phoneNumber,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              //    ********************    the form for the pin code
              const SizedBox(height: 20),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    obscureText: true,
                    obscuringCharacter: '*',
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldWidth: 60,
                      fieldHeight: 50,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.blue.shade50,
                      borderWidth: 0,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey,
                      selectedColor: Colors.blue,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    boxShadows: [
                      BoxShadow(
                        blurStyle: BlurStyle.outer,
                        color: Colors.black12, // shadow effect
                        blurRadius: 6,
                        spreadRadius: 6,
                        offset: Offset(3, 3),
                      )
                    ],
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    autoFocus: true, // for auto focus  {did not work}
                    cursorColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 20, height: 1.6),
                    controller: textEditingController,
                    errorAnimationController: errorController,
                    keyboardType: TextInputType.number,
                    onCompleted: (thePinNumber) {
                      print("Completed: $thePinNumber");
                    },
                    onChanged: (value) {
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      return true; // Allow pasting
                    },
                    validator: (v) {
                      if (v == null || v.length != 4) {
                        return "Please fill all the fields properly";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  hasError ? "Please enter a valid 4-digit code" : "",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
              //   ******************    the button
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1A73E8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (currentText != generatedPin) {
                          errorController.add(ErrorAnimationType.shake);
                          setState(() => hasError = true);
                          textEditingController.clear();
                        } else {
                          setState(() => hasError = false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Verification Successful!")),
                          );
                          textEditingController.clear();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SetNewPassword(),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      "VERIFY",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),

              //  ************************   the text for resend the code
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Didn't receive the code? ",
                  style: const TextStyle(color: Colors.black54, fontSize: 15),
                  children: [
                    TextSpan(
                      text: "Resend",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _generateNewPin();
                          ScaffoldMessenger.of(context).clearSnackBars();
                        },
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
