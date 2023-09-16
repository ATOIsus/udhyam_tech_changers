
import '../../domain/entity/supplier_entity.dart';

class SupplierState {
  final bool isLoading;
  final List<SupplierEntity> supplierList;
  final String? error;

  SupplierState({
    required this.isLoading,
    required this.supplierList,
    this.error,
  });

  factory SupplierState.initial() {
    return SupplierState(
      isLoading: false,
      supplierList: [],
    );
  }

  SupplierState copyWith({
    bool? isLoading,
    List<SupplierEntity>? supplierList,
    String? error,
  }) {
    return SupplierState(
      isLoading: isLoading ?? this.isLoading,
      supplierList: supplierList ?? this.supplierList,
      error: error ?? this.error,
    );
  }
}
