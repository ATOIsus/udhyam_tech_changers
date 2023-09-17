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
          appBar: AppBar(
            title: Text("Request"),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
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
                                  icon: Icon(Icons.clear)),
                              IconButton(
                                  color: Colors.blue,
                                  onPressed: () {},
                                  icon: Icon(Icons.check))
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
  StatusCell({required this.status});

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
            ? Text(
                "Completed",
                style: TextStyle(color: Colors.green),
              )
            : widget.status == 'declined'
                ? Text("Declined", style: TextStyle(color: Colors.red))
                : Text(
                    "Pending",
                    style: TextStyle(color: Colors.blue),
                  );
  }
}
