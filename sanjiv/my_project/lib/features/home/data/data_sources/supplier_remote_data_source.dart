import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoints.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_services.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../domain/entity/supplier_entity.dart';
import '../dto/supplier_dto.dart';
import '../model/supplier_api_model.dart';

final supplierRemoteDataSourceProvider =
    Provider<SupplierRemoteDataSource>((ref) {
  return SupplierRemoteDataSource(
    ref.watch(httpServicesProvider),
    ref.watch(userSharedPrefsProvider),
    ref.watch(supplierApiModelProvider),
  );
});

class SupplierRemoteDataSource {
  final Dio _dio;

  final UserSharedPrefs _userSharedPrefs;

  final SupplierApiModel _supplierApiModel;

  SupplierRemoteDataSource(
      this._dio, this._userSharedPrefs, this._supplierApiModel);

  Future<Either<Failure, List<SupplierEntity>>> getAllSuppliers() async {
    try {
      String? token;

      var data = await _userSharedPrefs.getUserToken();
      data.fold((l) => token = null, (r) => token = r!);

      Response res = await _dio.get(
        ApiEndpoints.supplierDashboard,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (res.statusCode == 200) {
        print('Got suppliers data from API');
        // convert JSON object into Entity list and return
        

         SupplierDTO supplierDTO = SupplierDTO.fromJson(res.data);

        return Right(supplierDTO.data);

      } else {
        return Left(
          Failure(
            error: res.data['error'],
            statusCode: res.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (err) {
      return Left(Failure(
        error: err.error.toString(),
        statusCode: err.response?.statusCode.toString() ?? '0',
      ),);
    }
  }
}
