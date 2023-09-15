import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/common/custom_textformfield.dart';
import '../../../../config/router/app_routes.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _gap = const SizedBox(height: 30);

  final _formKey = GlobalKey<FormState>();

  final _contactController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _hidePassword = true;

  IconData _hideIcon = Icons.remove_red_eye;

  @override
  void dispose() {
    super.dispose();

    _contactController.dispose();

    _passwordController.dispose();
  }

  void _resetControllers() {
    _contactController.clear();
    _passwordController.clear();
  }

  void _togglePasswordIcon() {
    if (_hidePassword) {
      setState(() {
        _hidePassword = false;
        _hideIcon = FontAwesomeIcons.eyeSlash;
      });
    } else {
      setState(() {
        _hidePassword = true;
        _hideIcon = Icons.remove_red_eye;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/showJalLogo.png'),
                  _gap,
                  CustomTextFormWidget(
                    fullNameController: _contactController,
                    frontIcon: Icons.phone,
                    name: 'Contact',
                    keyboardType: TextInputType.number,
                  ),
                  _gap,
                  TextFormField(
                    obscureText: _hidePassword,
                    controller: _passwordController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please, enter password'
                        : null,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _togglePasswordIcon();
                          },
                          icon: Icon(_hideIcon)),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                  ),
                  _gap,
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('register');
                      }
                    },
                    child: const Text('Register'),
                  ),
                  _gap,
                  TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(
                          context, AppRoutes.registerRoute);
                    },
                    child: const Text('Don\'t have an account ? Register Here'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(
                          context, AppRoutes.dashboardRoute);
                    },
                    child: const Text('Dashboard'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
