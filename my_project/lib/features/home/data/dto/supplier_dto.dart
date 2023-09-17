import 'package:json_annotation/json_annotation.dart';
import 'package:my_project/features/home/domain/entity/supplier_entity.dart';


part 'supplier_dto.g.dart';
@JsonSerializable()
class SupplierDTO {
  final List<SupplierEntity> data;

  SupplierDTO({required this.data});


  // fromJson
  factory SupplierDTO.fromJson(Map<String, dynamic> json) =>
      _$SupplierDTOFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$SupplierDTOToJson(this);
}
