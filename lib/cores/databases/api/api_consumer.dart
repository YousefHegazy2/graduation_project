import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;


abstract class ApiConsumer {
  Future<Either<String, dio.Response>> get({
    String? path,
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<String, dio.Response>> post({
    String? path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  Future<Either<String, dio.Response>> put({
    String? path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  Future<Either<String, dio.Response>> delete({
    String? path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
}
