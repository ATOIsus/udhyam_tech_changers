import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/data_sources/supplier_remote_data_source.dart';
import '../../data/repository/supplier_remote_repo_impl.dart';
import '../entity/supplier_entity.dart';

final supplierRepositoryProvider = Provider<ISupplierRepository>((ref) {
  return SupplierRemoteRepoImpl(ref.watch(supplierRemoteDataSourceProvider));
});

abstract class ISupplierRepository {
  Future<Either<Failure, List<SupplierEntity>>> getAllSuppliers();
}
