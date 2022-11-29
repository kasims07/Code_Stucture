import 'dart:async';

import 'package:flutter/material.dart';

import '../../constants/asset_path.dart';
import '../login_screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginScreen()
            )
        )
    );
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
