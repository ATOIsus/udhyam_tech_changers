import 'package:flutter/material.dart';

import '../../../domain/entity/data.dart';

class RoutineView extends StatefulWidget {
  const RoutineView({super.key});

  @override
  State<RoutineView> createState() => _RoutineViewState();
}

class _RoutineViewState extends State<RoutineView> {
  Data data = Data();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: SearchBar(
            padding: MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            leading: Icon(Icons.search),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Tripureshwor",
                        style: TextStyle(
                          fontSize: 21,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Day',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Time',
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
                          ],
                          rows: data.tripureshwor
                              .map(
                                (name) => DataRow(
                                  cells: [
                                    DataCell(
                                      Text(name.day),
                                      showEditIcon: false,
                                      placeholder: false,
                                    ),
                                    DataCell(
                                      Text(name.time),
                                      showEditIcon: false,
                                      placeholder: false,
                                    ),
                                    DataCell(
                                      Text(name.location),
                                      showEditIcon: false,
                                      placeholder: false,
                                    )
                                  ],
                                ),
                              )
                              .toList()),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Kritipur",
                        style: TextStyle(
                          fontSize: 21,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Day',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Time',
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
                          ],
                          rows: data.tripureshwor
                              .map(
                                (name) => DataRow(
                                  cells: [
                                    DataCell(
                                      Text(name.day),
                                      showEditIcon: false,
                                      placeholder: false,
                                    ),
                                    DataCell(
                                      Text(name.time),
                                      showEditIcon: false,
                                      placeholder: false,
                                    ),
                                    DataCell(
                                      Text(name.location),
                                      showEditIcon: false,
                                      placeholder: false,
                                    )
                                  ],
                                ),
                              )
                              .toList()),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ])),
    );
  }
}
