import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signupdetails_state.dart';

class SignupdetailsCubit extends Cubit<SignupdetailsState> {
  SignupdetailsCubit() : super(SignupdetailsInitial());
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController nationalidController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController frontsideidController = TextEditingController();
  final TextEditingController backsideidController = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  TextEditingController personalsammaryController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signupdetails({
    required String firstname,
    required String lastname,
    required String nationalid,
    final String? sammary,
    required String phone,
    required String frontid,
    required String backid,
    required String address,
    }){}
}
