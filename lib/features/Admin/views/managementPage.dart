import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/CustomAppBar.dart';
import 'package:rentora_app/cores/widgets/Custom_Category_Textfield.dart';
import 'package:rentora_app/features/Admin/cubit/admin_cubit.dart';
import 'package:rentora_app/features/Admin/widgets/managementWidget.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminCubit()..getadmin(),
      child: Scaffold(
        appBar: CustomAppBar(
          icon1: Icon(
            Icons.arrow_back,
            size: 26,
            color: const Color.fromARGB(255, 248, 248, 248),
          ),
          icon2: Icon(
            Icons.manage_accounts,
            size: 24,
            color: kPrimaryColorBlue,
          ),
          onPressedIcon1: () {
            Navigator.pop(context);
          },
          title: CustomCategoryTextfield(
            text: "Search for accounts",
          ),
        ),
        body: BlocBuilder<AdminCubit, AdminState>(
          builder: (context, state) {
            if (state is AdminLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AdminLoaded) {
              return ListView.builder(
                itemCount: state.admins.length,
                itemBuilder: (context, index) {
                  final admin = state.admins[index];
                  return ManagementWidget(
                    imageUrl: 'assets/images/profile.jpeg', // Placeholder image
                    title: admin.username,
                    subtitle: admin.email,
                  );
                },
              );
            } else if (state is AdminError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
