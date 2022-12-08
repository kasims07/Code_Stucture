import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';



import 'app_styles.dart';

class AppUtils {
  AppUtils._();

  /// used for getting device type
  /// used for getting device type
  /// used for getting device type
  static String getDeviceType() {
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isIOS) {
      return 'ios';
    } else {
      return '';
    }
  }




  static void showSnackBar(BuildContext context, String? text) {
    if (text != null && text.isNotEmpty) {
      final snackBar = SnackBar(content: Text(text));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  static Widget progressHudWidget(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppStyles.white),
    );
  }

  static Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static bool validateEmail(String? value) {
    /*String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";*/
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return false;
    else
      return true;

  }

  static bool validateName(String? value) {

    /*final validCharacters = RegExp(r'^[0-9_\-=@,\.;]+$');

    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";*/
    RegExp regex = RegExp(r'^[a-zA-Z ]+$');
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return false;
    else
      return true;

    final validCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
    print(validCharacters.hasMatch('abc123'));

  }

}
