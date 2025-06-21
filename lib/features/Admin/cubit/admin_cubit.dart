import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:rentora_app/features/Admin/models/admin_model.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  final Dio dio = Dio();

  Future<void> getadmin() async {
    emit(AdminLoading());
    try {
      final response = await dio.get(
        'https://rentora.runasp.net/api/Account/getAllUsers',
      );

      if (response.statusCode == 200) {
        final data = List<AdminModel>.from(
          (response.data['data'] as List).map((x) => AdminModel.fromJson(x)),
        );
        emit(AdminLoaded(data));
      } else {
        emit(AdminError("Failed to load users"));
      }
    } catch (e) {
      emit(AdminError("Error: $e"));
    }
  }
}

