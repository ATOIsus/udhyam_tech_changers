// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:my_project/config/constants/api_endpoints.dart';
// import 'package:my_project/features/home/domain/entity/request_entity.dart';

// import '../../../../core/failure/failure.dart';
// import '../../../../core/shared_prefs/user_shared_prefs.dart';

// class RequestsRemoteDataSource {
//   final Dio _dio;

//   final UserSharedPrefs _userSharedPrefs;

//   RequestsRemoteDataSource(this._dio, this._userSharedPrefs);

//   Future<Either<Failure, List<RequestEntity>>> getAllRequests() async {
//     try {
//       Response res = await _dio.get(ApiEndpoints.requestWater);
//     } on DioException catch (e) {
//       return Left(
//         Failure(
//           error: e.error.toString(),
//           statusCode: e.response?.statusCode.toString() ?? '0',
//         ),
//       );
//     }
//   }
// }
