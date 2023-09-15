import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _gap = const SizedBox(height: 30);

  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _locationController = TextEditingController();
  final _contactController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _hidePassword = true;

  IconData _hideIcon = FontAwesomeIcons.eyeSlash;

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
                      frontIcon: Icons.person,
                      name: 'Full Name'),
                  _gap,
                  CustomTextFormWidget(
                      fullNameController: _locationController,
                      frontIcon: Icons.location_on,
                      name: 'Location'),
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
                            if (_hidePassword) {
                              setState(() {
                                _hidePassword = false;
                                _hideIcon = Icons.remove_red_eye;
                              });
                            } else {
                              setState(() {
                                _hidePassword = true;
                                _hideIcon = FontAwesomeIcons.eyeSlash;
                              });
                            }
                          },
                          icon: Icon(_hideIcon)),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                  ),
                  _gap,
                  // CustomTextFormWidget(
                  //     fullNameController: _passwordController,
                  //     frontIcon: Icons.password,
                  //     hide: _hidePassword,
                  //     name: 'Password'),
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
    required IconData frontIcon,
  })  : _fullNameController = fullNameController,
        _name = name,
        _hide = hide ?? false,
        _keyboardType = keyboardType ?? TextInputType.name,
        _frontIcon = frontIcon;

  final TextEditingController _fullNameController;
  final String _name;
  final bool _hide;
  final TextInputType _keyboardType;
  final IconData _frontIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _hide,
      keyboardType: _keyboardType,
      controller: _fullNameController,
      validator: (value) =>
          value == null || value.isEmpty ? 'Please, enter $_name' : null,
      decoration: InputDecoration(
        prefixIcon: Icon(_frontIcon),
        prefixIconColor: Colors.black,
        hintText: 'Enter $_name',
        labelText: _name,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
    );
  }
}
