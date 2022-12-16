import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/screens/login_screens/login_screen.dart';
import 'package:gfive/screens/serviceDetailsScreens/addDetailsBookservice/login_book_service_screen.dart';
import 'package:gfive/screens/splashScreen/splash_screen.dart';
import 'package:gfive/utils/app_dependencies.dart';
import 'package:gfive/utils/app_routers.dart';
import 'package:device_preview/device_preview.dart';

import 'firebase_options.dart';



void main() async {
  /*runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      )
  );*/
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupDependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatefulWidget {


  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _router = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:  (context , child){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'G-Five',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SplashScreen(),
            onGenerateRoute: _router.getRoute,
            navigatorObservers: [_router.routeObserver]
        );
      },
    );
  }
}


