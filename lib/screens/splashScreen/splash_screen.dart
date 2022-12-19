import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_screens/app_screens.dart';
import '../../constants/app_constants.dart';
import '../../constants/asset_path.dart';
import '../login_screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    animation.addStatusListener((status) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isLogin = await prefs.getBool(AppConstants.login);

      if(isLogin == true){
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppScreens.dashboardScreen,
              (Route<dynamic> route) => false,
        );
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (Route<dynamic> route) => false,);
      }
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child:Image.asset(ImageAssetPath.splashScreen,fit: BoxFit.fill),
        ),
    );
  }
}
