import 'package:flutter/material.dart';
import 'orderinfo.dart';

class SupplierDahboard extends StatefulWidget {
  const SupplierDahboard({super.key});

  @override
  State<SupplierDahboard> createState() => _SupplierDahboardState();
}

class _SupplierDahboardState extends State<SupplierDahboard> {
  Order order = Order();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      Text(e.status),
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
                        children: [Icon(Icons.clear), Icon(Icons.check)],
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
