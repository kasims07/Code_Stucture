import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../../widgets/custom_account_backbutton.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bloc/terms_and_conditions_bloc.dart';


class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider<TermsAndConditionsBloc>(
          create: (_) => TermsAndConditionsBloc(),
        ),
      ],
      child: TermsAndConditions(),
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
                  SizedBox(width:75.h),
                  Text('Terms & Conditions', style:AppStyles.profilestyle)
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
