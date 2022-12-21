import 'package:flutter/material.dart';
import 'package:gfive/screens/dashBoard/dash_board_screen.dart';

import '../app_screens/app_screens.dart';
import '../screens/Account_screens/aboutUs/about_us.dart';
import '../screens/Account_screens/addAddress/add_address.dart';
import '../screens/Account_screens/contactUs/contact_us.dart';
import '../screens/Account_screens/editProfile/edit_profile_screen.dart';
import '../screens/Account_screens/manageAddress/manage_address.dart';
import '../screens/Account_screens/privacyPolicy/privacy_policy.dart';
import '../screens/Account_screens/termsAndConditions/terms_&_conditions.dart';
import '../screens/bookingServiceDetails/book_service_screen.dart';
import '../screens/change_address/change_address.dart';
import '../screens/otpScreen/verification_screen.dart';
import '../screens/profileScreen/profile_screen.dart';
import '../screens/serviceDetailsScreens/addDetailsBookservice/login_book_service_screen.dart';
import '../screens/serviceDetailsScreens/serviceDetails/service_detailsscreen.dart';
import '../screens/serviceDetailsScreens/subserviceDetails/subservice_details.dart';
import '../screens/splashScreen/splash_screen.dart';

class AppRouter {
  final RouteObserver<PageRoute> routeObserver;

  AppRouter() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppScreens.otpVerification:
        final arguments = settings.arguments as Map<String, dynamic>;
        return _buildRoute(
          settings,
          VerificationScreen.create(
            arguments['mobileNum'],
          ),
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
      case AppScreens.editProfile:
        return _buildRoute(
          settings,
          EditProfileScreen.create(),
        );
      case AppScreens.manageAddress:
        return _buildRoute(
          settings,
          ManageAddress.create(),
        );
      case AppScreens.termsAndConditions:
        return _buildRoute(
          settings,
          TermsAndConditions.create(),
        );
      case AppScreens.privacyPolicy:
        return _buildRoute(
          settings,
          PrivacyPolicy.create(),
        );
      case AppScreens.aboutUs:
        return _buildRoute(
          settings,
          AboutUs.create(),
        );
      case AppScreens.serviceDetails:
        final arguments = settings.arguments as Map<String, dynamic>;
        return _buildRoute(
          settings,
          ServiceDetailsScreen.create(
            arguments['categoryid']
          ),
        );
      case AppScreens.subserviceDetails:
        final arguments = settings.arguments as Map<String, dynamic>;
        return _buildRoute(
          settings,
          SubserviceDetails.create(arguments['subserviceid']),
        );

      case AppScreens.contactUs:
        return _buildRoute(
          settings,
          ContactUs.create(),
        );

      case AppScreens.loginBookservice:
        return _buildRoute(
          settings,
          LoginBookServiceScreen.create(),
        );

      case AppScreens.changeAddress:
        return _buildRoute(
          settings,
          ChangeAddress.create(),
        );

      case AppScreens.addAddress:
        return _buildRoute(
          settings,
          AddAddress.create(),
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