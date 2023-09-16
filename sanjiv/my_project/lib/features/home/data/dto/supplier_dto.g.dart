// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierDTO _$SupplierDTOFromJson(Map<String, dynamic> json) => SupplierDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => SupplierEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SupplierDTOToJson(SupplierDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
