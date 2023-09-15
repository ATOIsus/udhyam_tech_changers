import 'package:flutter/material.dart';
import 'package:show_jal/timetabledata.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  var tripureshwor = <WaterSupplyTime>[
    WaterSupplyTime(
        day: "Sunday",
        time: "8am : 9am",
        location: 'keshar mahal,inbhal,thamel,jhatya'),
    WaterSupplyTime(
        day: "Sunday",
        time: "10am : 11am",
        location: 'keshar mahal,inbhal,thamel,jhatya'),
    WaterSupplyTime(
        day: "Sunday",
        time: "12pm : 1pm",
        location: 'keshar mahal,inbhal,thamel,jhatya'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: const Text(
                "Supply chain",
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
      ),
    );
  }
}
