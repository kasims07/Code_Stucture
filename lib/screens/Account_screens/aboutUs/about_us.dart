import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/app_styles.dart';
import '../../../widgets/custom_account_backbutton.dart';
import 'bloc/about_us_bloc.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider<AboutUsBloc>(
          create: (_) => AboutUsBloc(),
        ),
      ],
      child: AboutUs(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //height: 844.h,
          width: 390.w,
          color: AppStyles.black,


          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 20),
                child:Row(
                  children: [
                    CustomAccountBackbutton(),
                    SizedBox(width:110.h),
                    Text('About Us', style:AppStyles.profilestyle)
                  ],
                ),),
              Container(
                  height:748.h ,
                  width: 390.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      color: AppStyles.white
                  ),
                  child: const WebView(
                    initialUrl:'https://www.google.com/',
                    javascriptMode: JavascriptMode.unrestricted,
                  )
              )
            ],
          ),
        ),
      ),
    ),

    );
  }
}


