import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/screens/Account_screens/add_address.dart';
import 'package:gfive/screens/Account_screens/edit_profile_screen.dart';
import 'package:gfive/screens/Account_screens/manage_address.dart';
import 'package:gfive/screens/login_screens/login_screen.dart';
import 'package:gfive/screens/splashScreen/splash_screen.dart';
import 'package:gfive/utils/app_dependencies.dart';
import 'package:gfive/utils/app_routers.dart';

void main() {
  runApp(const MyApp());
  setupDependencies();
  WidgetsFlutterBinding.ensureInitialized();
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
            home:AddAddress(),
            onGenerateRoute: _router.getRoute,
            navigatorObservers: [_router.routeObserver]
        );
      },
    );
  }
}


