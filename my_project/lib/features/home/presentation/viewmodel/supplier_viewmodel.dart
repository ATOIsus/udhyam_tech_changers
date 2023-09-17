import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/use_case/supplier_usecase.dart';
import '../state/supplier_state.dart';

final supplierViewModelProvider =
    StateNotifierProvider<SupplierViewModel, SupplierState>(
  (ref) => SupplierViewModel(ref.read(supplierUseCaseProvider)),
);

class SupplierViewModel extends StateNotifier<SupplierState> {
  final SupplierUseCase _supplierUseCase;
  SupplierViewModel(this._supplierUseCase) : super(SupplierState.initial()) {
    getAllSuppliers();
  }

  Future<void> getAllSuppliers() async {
    state = state.copyWith(isLoading: true);
    var data = await _supplierUseCase.getAllSuppliers();
    data.fold((failure) {
      state = state.copyWith(isLoading: false, error: failure.error);
    }, (routineList) {
      state = state.copyWith(
          isLoading: false, supplierList: routineList, error: null);
    });
  }
}
