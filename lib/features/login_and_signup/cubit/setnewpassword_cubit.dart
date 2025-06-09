import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'setnewpassword_state.dart';

class SetnewpasswordCubit extends Cubit<SetnewpasswordState> {
  SetnewpasswordCubit() : super(SetnewpasswordInitial());
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmedpasswordcontroller =TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setnewpassword(
      {required String password, required String passwordconfirmed}) {}
}
