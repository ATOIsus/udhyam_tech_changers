import 'package:flutter/material.dart';

import 'timetabledata.dart';


class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  Data data = Data();
  String userLocation = "thamel";

  var userTimeTable = <WaterSupplyTime>[];
  var wholeTime = <WaterSupplyTime>[];
  var tripureshwor = <WaterSupplyTime>[];
  var kritipur = <WaterSupplyTime>[];

  final TextEditingController? controller = TextEditingController();

  bool _islooged = false;

  @override
  void initState() {
    super.initState();

    //user location supply time
    data.Watersupplytime.forEach((element) {
      if (element.location.contains(userLocation)) {
        userTimeTable.add(element);
      }
    });

    //tripureshwor supply time
    data.Watersupplytime.forEach((element) {
      if (element.source == "tripureshwor") {
        tripureshwor.add(element);
      }
    });

    //kritipur supply time
    data.Watersupplytime.forEach((element) {
      if (element.source == "kritipur") {
        kritipur.add(element);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: SearchBar(
            controller: controller,
            padding: MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            leading: Icon(Icons.search),
            hintText: '  Search...',
            hintStyle:
                MaterialStateProperty.all(const TextStyle(color: Colors.grey)),
            onChanged: (String value) {
              print('value: $value');
            },
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _islooged
                    ? Column(
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
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "thamel",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 12,
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Expanded(
                                      child: Text(
                                        'Time',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Expanded(
                                      child: Text(
                                        'Location',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                      )
                    : Container(),
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
                          rows: tripureshwor
                              .map((name) => DataRow(
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
                                  ))
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
                          rows: kritipur
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
