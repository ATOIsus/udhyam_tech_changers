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

  late UserEntity? user;

  final UserSharedPrefs _userSharedPrefs = UserSharedPrefs();
  @override
  void initState() {
    super.initState();

    user = AuthState.userEntity;

    markers = {};
    myLocation = const LatLng(27.6837614, 85.2907682);
    secondSourceLocation = const LatLng(27.6837624, 85.2471975);

    var source1 = Marker(
      markerId: const MarkerId('myLocation'),
      position: myLocation,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      infoWindow: const InfoWindow(
        title: 'Pani Tanki (13103m altitude)',
        snippet: 'Drinking Water Source',
      ),
    );
    var source2 = Marker(
      markerId: const MarkerId('secondSourceLocation'),
      position: secondSourceLocation,
      infoWindow: const InfoWindow(
        title: 'Water Tank (12007m altitude)',
        snippet: 'Drinking Water Source',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

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
    print('Simple Notification got clicked');

    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'wer',
      'asdf', // channel name can be anything,
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
      12333,
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
          style: const TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // _showSimpleNotifications();
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
