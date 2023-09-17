import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_project/config/router/app_routes.dart';
import 'package:my_project/core/shared_prefs/user_shared_prefs.dart';
import 'package:permission_handler/permission_handler.dart';

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
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
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
              'House $count pressure: ${reading1 -= 20}pa, reading: ${reading2 += 40}}',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
      markers.add(houseSource);
    }

    List<Marker> houseSources = [];

    // add sources
    markers.add(source1);
    markers.add(source2);

    requestPermission();

    // _getUserData();
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
