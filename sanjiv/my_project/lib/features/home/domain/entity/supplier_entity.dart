import 'package:equatable/equatable.dart';

class SupplierEntity extends Equatable {
  // final String? id;
  final String contactNumber;

  final String price;
  final String accept;
  final String status;

  const SupplierEntity(
      {
        // this.id,
      required this.contactNumber,
      required this.price,
      required this.accept,
      required this.status});

  // convert JSON to routine entity

  factory SupplierEntity.fromJson(Map<String, dynamic> json) {
    return SupplierEntity(
      // id: json['_id'],
      contactNumber: json['contactNumber'],
      price: json['price'],
      accept: json['accept'],
      status: json['status'],
    );
  }

  // convert routine entity to JSON
  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      'contactNumber': contactNumber,
      'price': price,
      'accept': accept,
      'status': status,
    };
  }

  @override
  String toString() {
    return 'Contact Nnumber: $contactNumber, Price: $price, Accept actions: $accept, Status: $status';
  }

  @override
  List<Object?> get props => [contactNumber, price, accept, status];
}
