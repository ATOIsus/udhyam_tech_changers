import 'package:flutter/material.dart';
import 'package:show_jal/timetabledata.dart';


class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  Data data = Data();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
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
      )),
    );
  }
}
