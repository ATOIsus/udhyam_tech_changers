import 'package:flutter/material.dart';
import 'package:show_jal/timetable.dart';
import 'package:show_jal/view/signin.dart';
import 'package:show_jal/view/signup.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/routine',
      routes: {
        '/signin': (context) => const SignInView(),
        '/signup': (context) => const SigUpView(),
        '/routine': (context) => const TimeTable()
      },
    );
  }
}
