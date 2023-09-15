import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _gap = const SizedBox(height: 30);

  final _formKey = GlobalKey<FormState>();
  final String _name = 'Full name';

  final _fullNameController = TextEditingController();
  final _locationController = TextEditingController();
  final _contactController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final bool _hidePassword = true;

  @override
  void dispose() {
    super.dispose();

    _locationController.dispose();
    _usernameController.dispose();
    _contactController.dispose();
    _fullNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  void _resetControllers() {
    _locationController.clear();
    _usernameController.clear();
    _contactController.clear();
    _fullNameController.clear();
    _usernameController.clear();
    _passwordController.clear();
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
                      fullNameController: _fullNameController,
                      name: 'Full Name'),
                  _gap,
                  CustomTextFormWidget(
                      fullNameController: _locationController,
                      name: 'Location'),
                  _gap,
                  CustomTextFormWidget(
                    fullNameController: _contactController,
                    name: 'Contact',
                    keyboardType: TextInputType.number,
                  ),
                  _gap,
                  CustomTextFormWidget(
                      fullNameController: _passwordController,
                      hide: _hidePassword,
                      name: 'Password'),
                  _gap,
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('loging');
                        }
                      },
                      child: const Text('Login'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormWidget extends StatelessWidget {
  const CustomTextFormWidget({
    super.key,
    required TextEditingController fullNameController,
    required String name,
    bool? hide,
    TextInputType? keyboardType,
  })  : _fullNameController = fullNameController,
        _name = name,
        _hide = hide ?? false,
        _keyboardType = keyboardType ?? TextInputType.name;

  final TextEditingController _fullNameController;
  final String _name;
  final bool _hide;
  final TextInputType _keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _hide,
      keyboardType: _keyboardType,
      controller: _fullNameController,
      validator: (value) =>
          value == null || value.isEmpty ? 'Please, enter $_name' : null,
      decoration: InputDecoration(
        hintText: 'Enter $_name',
        labelText: _name,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
    );
  }
}
