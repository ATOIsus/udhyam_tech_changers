import 'package:flutter/material.dart';
import 'package:my_project/config/router/app_routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Text('Home'),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.loginRoute);
              },
              child: const Text('Logout'))
        ],
      )),
    );
  }
}
