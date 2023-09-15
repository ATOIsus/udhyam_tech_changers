import 'package:flutter/material.dart';

class SigUpView extends StatefulWidget {
  const SigUpView({super.key});

  @override
  State<SigUpView> createState() => _SigUpViewState();
}

class _SigUpViewState extends State<SigUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.bottomRight,
            child: const Text("Sign Up Page"),
          ),
        ),
      )),
    );
  }
}
