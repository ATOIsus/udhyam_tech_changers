import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/supplier_entity.dart';
import '../repository/supplier_repository.dart';

final supplierUseCaseProvider = Provider<SupplierUseCase>((ref) {
  return SupplierUseCase(ref.watch(supplierRepositoryProvider));
});

class SupplierUseCase {
  final ISupplierRepository _supplierRepository;

  SupplierUseCase(this._supplierRepository);

  Future<Either<Failure, List<SupplierEntity>>> getAllSuppliers() {
    return _supplierRepository.getAllSuppliers();
  }
}
