import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/features/home/presentation/viewmodel/supplier_viewmodel.dart';

import '../../../../config/router/app_routes.dart';

class SupplierDashboardView extends ConsumerStatefulWidget {
  const SupplierDashboardView({super.key});

  @override
  ConsumerState<SupplierDashboardView> createState() =>
      _SupplierDashboardViewState();
}

class _SupplierDashboardViewState extends ConsumerState<SupplierDashboardView> {
  Order order = Order();

  @override
  Widget build(BuildContext context) {
    var supplierSate = ref.watch(supplierViewModelProvider);
    print('Length of supplier list is : ${supplierSate.supplierList.length}');

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Supplier Dashboard"),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, AppRoutes.loginRoute);
                  },
                  icon: const Icon(Icons.logout))
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Contact',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Location',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Action',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
                rows: order.orders
                    .map(
                      (e) => DataRow(cells: [
                        DataCell(
                          StatusCell(status: e.status),
                          showEditIcon: false,
                          placeholder: false,
                        ),
                        DataCell(
                          Text(e.Location),
                          showEditIcon: false,
                          placeholder: false,
                        ),
                        DataCell(
                          Text(e.contact),
                          showEditIcon: false,
                          placeholder: false,
                        ),
                        DataCell(
                          Row(
                            children: [
                              IconButton(
                                  color: Colors.red,
                                  onPressed: () {},
                                  icon: const Icon(Icons.clear)),
                              IconButton(
                                  color: Colors.blue,
                                  onPressed: () {},
                                  icon: const Icon(Icons.check))
                            ],
                          ),
                          showEditIcon: false,
                          placeholder: false,
                        )
                      ]),
                    )
                    .toList()),
          )),
    );
  }
}

class StatusCell extends StatefulWidget {
  String status;

  StatusCell({super.key, required this.status});

  @override
  State<StatusCell> createState() => _StatusCellState();
}

class _StatusCellState extends State<StatusCell> {
  @override
  Widget build(BuildContext context) {
    return widget.status == 'ongoing'
        ? Text(
            "Ongoing",
            style: TextStyle(color: Colors.yellow[800]),
          )
        : widget.status == 'completed'
            ? const Text(
                "Completed",
                style: TextStyle(color: Colors.green),
              )
            : widget.status == 'declined'
                ? const Text("Declined", style: TextStyle(color: Colors.red))
                : const Text(
                    "Pending",
                    style: TextStyle(color: Colors.blue),
                  );
  }
}

class OrderInfo {
  String status;

  String contact;

  String Location;

  OrderInfo(
      {required this.status, required this.contact, required this.Location});
}

class Order {
  var orders = <OrderInfo>[
    OrderInfo(
        status: 'ongoing', contact: '9484754838', Location: 'Balaju,Kathmandu'),
    OrderInfo(
        status: 'completed', contact: '9484754839', Location: 'Gurko,Lalitpur'),
    OrderInfo(
        status: 'declined',
        contact: '9484754830',
        Location: 'Lolang,Kathmandu'),
    OrderInfo(
        status: 'pending',
        contact: '9484754831',
        Location: 'Samakhusi,Kathmandu')
  ];
}
