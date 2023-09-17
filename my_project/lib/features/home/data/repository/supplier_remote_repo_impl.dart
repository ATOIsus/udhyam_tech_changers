import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/supplier_entity.dart';
import '../../domain/repository/supplier_repository.dart';
import '../data_sources/supplier_remote_data_source.dart';

final supplierRemoteRepImplProvider = Provider((ref) =>
    SupplierRemoteRepoImpl(ref.watch(supplierRemoteDataSourceProvider)));

class SupplierRemoteRepoImpl implements ISupplierRepository {
  final SupplierRemoteDataSource _supplierRemoteDataSource;

  SupplierRemoteRepoImpl(this._supplierRemoteDataSource);

  @override
  Future<Either<Failure, List<SupplierEntity>>> getAllSuppliers() {
    return _supplierRemoteDataSource.getAllSuppliers();
  }
}
