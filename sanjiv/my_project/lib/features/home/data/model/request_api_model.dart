import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/request_entity.dart';

final requestApiModelProvider = Provider((ref) => RequestApiModel.empty());

@JsonSerializable()
class RequestApiModel {
  @JsonKey(name: '_id') // might be unnecessary here
  final String? id;
  final String contactNumber;
  final String price;
  final String accept;
  final String status;

  const RequestApiModel({
    this.id,
    required this.contactNumber,
    required this.price,
    required this.accept,
    required this.status,
  });

  RequestApiModel.empty()
      : this(contactNumber: '', price: '', accept: '', status: '');

  // convert JSON to routine entity
  factory RequestApiModel.fromJson(Map<String, dynamic> json) {
    return RequestApiModel(
      id: json['_id'],
      contactNumber: json['contactNumber'],
      price: json['price'],
      accept: json['accept'],
      status: json['status'],
    );
  }

  // convert routine entity to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'contactNumber': contactNumber,
      'price': price,
      'accept': accept,
      'status': status,
    };
  }

  // convert to entity
  RequestEntity toEntity() {
    return RequestEntity(
      id: id,
      contactNumber: contactNumber,
      price: price,
      accept: accept,
      status: status,
    );
  }

// conversion of list of routine api model to list of entity
  List<RequestEntity> toEntityList(List<RequestApiModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
