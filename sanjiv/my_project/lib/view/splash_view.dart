import 'dart:async';

import 'package:flutter/material.dart';

import '../router/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(context, AppRoutes.loginRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/showJalLogo.png'),
            const Text('Version 1.0.0'),
            const SizedBox(
              height: 40,
            ),
            const Text('Developed by Tech Changers'),
          ],
        ),
      ),
    );
  }
}
