import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_project/core/shared_prefs/user_shared_prefs.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../main.dart';
import '../../../../auth/domain/entity/user_entity.dart';
import '../../../../auth/presentation/state/auth_state.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

Future<void> requestPermission() async {
  await Permission.location.request();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late GoogleMapController mapController;
  late Set<Marker> markers;
  late LatLng myLocation;
  late LatLng secondSourceLocation;

  late List<LatLng> housePositions;

  late UserEntity? user;

  final UserSharedPrefs _userSharedPrefs = UserSharedPrefs();
  @override
  void initState() {
    super.initState();

    user = AuthState.userEntity;

    markers = {};
    myLocation = const LatLng(27.6920, 85.290000);
    secondSourceLocation = const LatLng(27.6920, 85.290147);

    housePositions = [
      const LatLng(27.69185, 85.290477),
      const LatLng(27.69160, 85.290877),
      const LatLng(27.69134, 85.291377),
      const LatLng(27.69135, 85.291777),
      const LatLng(27.69105, 85.292177),
    ];

    var count = 1;
    var reading1 = 32;
    var reading2 = 113;

    var source1 = Marker(
      markerId: const MarkerId('myLocation'),
      position: myLocation,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title: 'Pani Tanki (13103m altitude)',
        snippet: 'Drinking Water Source, 4inch pipe, 20pa pressure',
      ),
    );
    var source2 = Marker(
      markerId: const MarkerId('secondSourceLocation'),
      position: secondSourceLocation,
      infoWindow: InfoWindow(
        title: 'House 1',
        snippet:
            'House $count pressure: ${reading1 -= 2}pa, reading: ${reading2 += 40}}',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    for (var element in housePositions) {
      var houseSource = Marker(
        markerId: MarkerId(element.toString()),
        position: element,
        infoWindow: InfoWindow(
          title: 'House ${count++}',
          snippet:
              'House $count pressure: ${reading1 -= 2}pa, reading: ${reading2 += 40}}',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
      markers.add(houseSource);
    }

    // add sources
    markers.add(source1);
    markers.add(source2);

    var farHousePositions = [
      const LatLng(27.73966, 85.288913),
      const LatLng(27.73866, 85.286913),
      const LatLng(27.73766, 85.289913),
      const LatLng(27.73666, 85.286913),
    ];

    var midHousePositions = [
      const LatLng(27.73666, 85.288913),
      const LatLng(27.73566, 85.286913),
      const LatLng(27.73466, 85.288913),
      const LatLng(27.73366, 85.286913),
    ];

    var closeHousePositions = [
      const LatLng(27.729999, 85.289913),
      const LatLng(27.732066, 85.289913),
      const LatLng(27.732166, 85.287913),
      const LatLng(27.732066, 85.285413),
    ];

    for (var element in closeHousePositions) {
      var houseSource = Marker(
        markerId: MarkerId(element.toString()),
        position: element,
        infoWindow: InfoWindow(
          title: 'House ${count++}',
          snippet: 'Predicted pressure: 5pa, altitude: 1300m}',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      );
      markers.add(houseSource);
    }

    for (var element in midHousePositions) {
      var houseSource = Marker(
        markerId: MarkerId(element.toString()),
        position: element,
        infoWindow: InfoWindow(
          title: 'House ${count++}',
          snippet: 'Predicted pressure: 4pa, altitude: 1400m}',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      );
      markers.add(houseSource);
    }

    for (var element in farHousePositions) {
      var houseSource = Marker(
        markerId: MarkerId(element.toString()),
        position: element,
        infoWindow: InfoWindow(
          title: 'House ${count++}',
          snippet: 'Predicted pressure: 1pa, altitude: 1500m}',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
      markers.add(houseSource);
    }

    var source = Marker(
      markerId: const MarkerId('Water Source hai'),
      position: const LatLng(27.731566, 85.288813),
      infoWindow: const InfoWindow(
        title: 'Water Source',
        snippet: 'Source pressure: 5pa, altitude: 1300m',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );

    markers.add(source);

    requestPermission();

    // _getUserData();
  }

  void _showAlert() {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Order Confirmation",
      desc: "Are you sure want to order water ?",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: "Water booked successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          },
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          onPressed: () => Navigator.pop(context),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
          child: const Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  void _clearSharedPrefs() {
    _userSharedPrefs.clearSharedPrefs();
  }

  final _gap = const SizedBox(height: 20);

  void _showSimpleNotifications() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'channelId',
      'channelName',
      priority: Priority.max,
      importance: Importance.max,
      enableLights: true,
      enableVibration: true,
    );

    DarwinNotificationDetails iosNotificationDetail =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentBanner: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetail,
    );

    // show the notification
    await notificationsPlugin.show(
      123,
      'New Notification',
      'Paani aayo',
      notificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: DraggableFab(
        child: Container(
          // color: Colors.amber,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: FloatingActionButton.large(
            elevation: 8,
            onPressed: () {
              _showAlert();
            },
            shape: const RoundedRectangleBorder(),
            child: const Row(
              children: [
                Icon(Icons.water_drop),
                SizedBox(width: 8),
                Expanded(child: Text('Order Water')),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Hi, ${user!.fullName.split(' ')[0]}!',
          style: const TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showSimpleNotifications();
            },
            icon: const Icon(Icons.notifications_active),
          ),
          _gap,
          IconButton(
            onPressed: () {
              _clearSharedPrefs();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.loginRoute, (Route<dynamic> route) => false);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(target: myLocation, zoom: 15),
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }
}
