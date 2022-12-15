import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/app_styles.dart';
import '../../../widgets/custom_account_backbutton.dart';
import 'bloc/privacy_policy_bloc.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider<PrivacyPolicyBloc>(
          create: (_) => PrivacyPolicyBloc(),
        ),
      ],
      child: PrivacyPolicy(),
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
                    SizedBox(width:90.h),
                    Text('Privacy Policy', style:AppStyles.profilestyle)
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

