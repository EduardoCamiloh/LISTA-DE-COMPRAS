import 'package:get/get.dart';
import 'package:teste/auth/auth.dart';
import 'package:teste/auth/cadastro.dart';
import 'package:teste/componets/splash.dart';

abstract class PagesRoutes {
  static final pages = <GetPage>[
    GetPage(
      page: () => SplashScreen(),
      name: '/splash',
    ),
    GetPage(
      page: () => AuthIn(),
      name: '/authin',
    ),
    GetPage(
      page: () => AuthUp(),
      name: '/authup',
    ),
  ];
}
