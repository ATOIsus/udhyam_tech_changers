import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoints.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_services.dart';
import '../../domain/entity/user_entity.dart';

final authRemoteDataSourceProvider = Provider(
  (ref) => AuthRemoteDataSource(
    ref.read(httpServicesProvider),
  ),
);

class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  // user login

  Future<Either<Failure, bool>> registerUser(UserEntity userEntity) async {
    try {
      Response res = await _dio.post(ApiEndpoints.register, data: {
        "fullName": userEntity.fullName,
        "contact": userEntity.contactNumber,
        "address": userEntity.address,
        "password": userEntity.password,
      });
      if (res.statusCode == 201) {
        return const Right(true);
      }

      // throw error if failed in register

      return Left(
        Failure(
          error: res.data['error'],
          statusCode: res.statusCode.toString(),
        ),
      );
    } on DioException catch (e) {
      return Left(Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0'));
    }
  }

  // user register

  // shared pres
}
