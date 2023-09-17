import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/supplier_entity.dart';

final supplierApiModelProvider = Provider((ref) => SupplierApiModel.empty());

@JsonSerializable()
class SupplierApiModel {
  // @JsonKey(name: '_id')
  // final String? id;
  final String contactNumber;
  final String price;
  final String accept;
  final String status;

  SupplierApiModel({
    // this.id,
    required this.contactNumber,
    required this.price,
    required this.accept,
    required this.status,
  });

  // initial values
  SupplierApiModel.empty()
      : this(
          contactNumber: '',
          price: '',
          accept: '',
          status: '',
        );

  // convert JSON to supplier entity
  factory SupplierApiModel.fromJson(Map<String, dynamic> json) {
    return SupplierApiModel(
      // id: json['_id'],
      contactNumber: json['contactNumber'],
      price: json['price'],
      accept: json['accept'],
      status: json['status'],
    );
  }

  // convert supplier entity to json
  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      'contactNumber': contactNumber,
      'price': price,
      'accept': accept,
      'status': status,
    };
  }

  // convert to entity

  SupplierEntity toEntity() {
    return SupplierEntity(
      // id: id,
      contactNumber: contactNumber,
      price: price,
      accept: accept,
      status: status,
    );
  }

  // convert to entity list
  List<SupplierEntity> toEntityList(List<SupplierApiModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
