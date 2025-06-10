import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'forgetpassword_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  ForgetpasswordCubit() : super(ForgetpasswordInitial());
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
