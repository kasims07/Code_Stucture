import 'package:flutter/material.dart';
import 'package:gfive/screens/dashBoard/dash_board_screen.dart';

import '../app_screens/app_screens.dart';
import '../screens/bookingServiceDetails/book_service_screen.dart';
import '../screens/otpScreen/verification_screen.dart';
import '../screens/profileScreen/profile_screen.dart';
import '../screens/splashScreen/splash_screen.dart';

class AppRouter {
  final RouteObserver<PageRoute> routeObserver;

  AppRouter() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppScreens.otpVerification:
        return _buildRoute(
          settings,
          VerificationScreen.create(),
        );
      case AppScreens.profileScreen:
        return _buildRoute(
          settings,
          ProfileScreen.create(),
        );
      case AppScreens.dashboardScreen:
        return _buildRoute(
          settings,
          DashBoardScreen.create(),
        );
      case AppScreens.bookingDetail:
        return _buildRoute(
          settings,
          BookServiceScreen.create(),
        );
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