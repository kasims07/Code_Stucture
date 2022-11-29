import 'package:flutter/material.dart';

import '../app_screens/app_screens.dart';
import '../screens/splashScreen/splash_screen.dart';

class AppRouter {
  final RouteObserver<PageRoute> routeObserver;

  AppRouter() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppScreens.splashscreen:
      //   return _buildRoute(
      //     settings,
      //     SplashScreen.create(),
      //   );
         default:
        return _buildRoute(settings, Container());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => builder,
    );
  }
}