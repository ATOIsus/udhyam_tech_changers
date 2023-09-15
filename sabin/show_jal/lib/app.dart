import 'package:flutter/material.dart';
import 'package:show_jal/view/signin.dart';
import 'package:show_jal/view/signup.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signin',
      routes: {
        '/signin': (context) => const SignInView(),
        '/signup': (context) => const SigUpView(),
      },
    );
  }
}
