import 'package:desafio/screens/login/login_binding.dart';
import 'package:desafio/screens/login/login_screen.dart';
import 'package:desafio/screens/map/map_binding.dart';
import 'package:desafio/screens/map/map_screen.dart';
import 'package:desafio/screens/splash/splash_binding.dart';
import 'package:desafio/screens/splash/splash_screen.dart';
import 'package:get/route_manager.dart';

class StringRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
}

class GetRoutes {
  // ignore: always_specify_types
  static List<GetPage> routes = [
    GetPage<SplashScreen>(
      name: StringRoutes.splash,
      page: () => SplashScreen(),
      transition: Transition.native,
      binding: SplashBinding(),
    ),
    GetPage<LoginScreen>(
      name: StringRoutes.login,
      page: () => LoginScreen(),
      transition: Transition.native,
      binding: LoginBinding(),
    ),
    GetPage<MapScreen>(
      name: StringRoutes.home,
      page: () => MapScreen(),
      transition: Transition.native,
      binding: MapBinding(),
    ),
  ];
}
