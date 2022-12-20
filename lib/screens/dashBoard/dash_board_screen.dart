import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/screens/homeScreen/home_screen.dart';
import 'package:gfive/utils/stream_builder.dart';

import '../../widgets/custom_bottombar.dart';
import '../Account_screens/account_screen.dart';
import '../myBookingScreens/book_main_screen.dart';
import '../notifications_Screen/notifications_screen.dart';
import 'bloc/dashboard_bloc.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);


  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(
          create: (_) => DashboardBloc(),
        ),
      ],
      child: const DashBoardScreen(),
    );
  }

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar: DashboardBottombar(),
          body: Container(

            child: StreamBuilder<int>(
              stream: StreamUtil.bottombar,
              builder: (context, snapshot) {
                return snapshot.data == 0 ? HomeScreen() :snapshot.data == 1 ? BookMainScreen() : snapshot.data == 2 ? NotificationsScreen() : AccountScreen();
              }
            ),
          ),
        ));
  }
}
