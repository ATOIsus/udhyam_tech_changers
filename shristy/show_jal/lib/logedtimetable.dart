import 'package:flutter/material.dart';
import 'package:show_jal/timetabledata.dart';

class LogedTimeTable extends StatefulWidget {
  @override
  State<LogedTimeTable> createState() => _LogedTimeTableState();
}

class _LogedTimeTableState extends State<LogedTimeTable> {
  Data data = Data();
  String userLocation = "thamel";

  var userTimeTable = <WaterSupplyTime>[];

  void initState() {
    super.initState();
    data.tripureshwor.forEach((element) {
      if (element.location.contains(userLocation)) {
        userTimeTable.add(element);
      }
    });
  }

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
                    "Your location",
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "thamel",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columns: <DataColumn>[
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
                      rows: userTimeTable
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
                    "Tripureshwor",
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columns: <DataColumn>[
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
                Padding(
                  padding: EdgeInsets.all(20),
                  child: const Text(
                    "Kritipur",
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columns: <DataColumn>[
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
