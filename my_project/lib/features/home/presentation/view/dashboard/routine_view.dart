import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/features/auth/presentation/state/auth_state.dart';

import '../../../domain/entity/routine_entity.dart';
import '../../viewmodel/routine_viewmodel.dart';

class RoutineView extends ConsumerStatefulWidget {
  const RoutineView({super.key});

  @override
  ConsumerState<RoutineView> createState() => _RoutineViewState();
}

class _RoutineViewState extends ConsumerState<RoutineView> {
  // List<RoutineEntity> _filteredRoutineList = [];
  List<RoutineEntity> _filteredRoutineList = [];
  bool _isInitializeSearching = false;

  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // if (_isInitializeSearching == false) {
    //   setState(() {
    //     _filteredRoutineList = ref.read(routineViewModelProvider).routine;
    //   });
    // }

    _searchController.addListener(_onSearchingRoutine);
  }

  void _onSearchingRoutine() {
    String query = _searchController.text.trim().toLowerCase();

    if (query.isEmpty) {
      setState(() {
        _filteredRoutineList = ref.read(routineViewModelProvider).routine;
      });
    } else {
      setState(() {
        _isInitializeSearching = true;

        _filteredRoutineList = ref
            .read(routineViewModelProvider)
            .routine
            .where((routine) =>
                routine.day.toLowerCase().contains(query) ||
                routine.location.toLowerCase().contains(query) ||
                routine.startTime.contains(query) ||
                routine.endTime.contains(query))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var routineList = ref.watch(routineViewModelProvider);

    if (_isInitializeSearching == false) {
      _filteredRoutineList = routineList.routine;
    }

    print('User addres is : ${AuthState.userEntity!.address}');
    List<RoutineEntity> userRoutine = _filteredRoutineList
        .where((singleRoutine) => singleRoutine.location
            .toLowerCase()
            .contains(AuthState.userEntity!.address.toLowerCase()))
        .toList();

    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SearchBar(
            controller: _searchController,
            hintText: 'Search by day, time or location',
            hintStyle:
                MaterialStateProperty.all(const TextStyle(color: Colors.grey)),
            padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            leading: const Icon(Icons.search),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                if (routineList.isLoading) ...{
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                } else if (routineList.error != null) ...{
                  Expanded(
                      child: Center(
                    child: Text(
                      'Error: ${routineList.error!}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ))
                } else if (_isInitializeSearching
                    ? _filteredRoutineList.isEmpty
                    : routineList.routine.isEmpty) ...{
                  const Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        'No Routine Found',
                      ),
                    ),
                  )
                } else if (_filteredRoutineList != []) ...{
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "My Routine",
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Time',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Location',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                            rows: userRoutine
                                .map(
                                  (singleRoutine) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(singleRoutine.day),
                                        showEditIcon: false,
                                        placeholder: false,
                                      ),
                                      DataCell(
                                        Text(
                                            '${singleRoutine.startTime} - ${singleRoutine.endTime}'),
                                        showEditIcon: false,
                                        placeholder: false,
                                      ),
                                      DataCell(
                                        Text(singleRoutine.location),
                                        showEditIcon: false,
                                        placeholder: false,
                                      )
                                    ],
                                  ),
                                )
                                .toList()),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Water Supply Routine",
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Time',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Location',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                            rows: _filteredRoutineList
                                .map(
                                  (singleRoutine) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(singleRoutine.day),
                                        showEditIcon: false,
                                        placeholder: false,
                                      ),
                                      DataCell(
                                        Text(
                                            '${singleRoutine.startTime} - ${singleRoutine.endTime}'),
                                        showEditIcon: false,
                                        placeholder: false,
                                      ),
                                      DataCell(
                                        Text(singleRoutine.location),
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
                },
              ],
            ),
          ),
        ),
      ])),
    );
  }
}
