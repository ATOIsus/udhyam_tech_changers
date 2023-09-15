import 'package:my_project/view/login_view.dart';

import '../view/splash_view.dart';

class AppRoutes {
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';

  static getApplicationRoutes() {
    return {
      splashRoute: (context) => const SplashView(),
      loginRoute: (context) => const LoginView(),
    };
  }
}
