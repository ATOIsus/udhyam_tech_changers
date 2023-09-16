import 'package:equatable/equatable.dart';

class RequestEntity extends Equatable {
  final String? id;
  final String contactNumber;
  final String price;
  final String accept;
  final String status;

  const RequestEntity({
    this.id,
    required this.contactNumber,
    required this.price,
    required this.accept,
    required this.status,
  });

  // convert JSON to routine entity
  factory RequestEntity.fromJson(Map<String, dynamic> json) {
    return RequestEntity(
      id: json['_id'],
      contactNumber: json['contactNumber'],
      price: json['price'],
      accept: json['accept'],
      status: json['status'],
    );
  }

  @override
  List<Object?> get props => [id, contactNumber, price, accept, status];

  @override
  String toString() {
    return 'contactNumber: $contactNumber, price: $price, accept: $accept, status: $status';
  }
}
