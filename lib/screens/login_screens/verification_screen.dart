import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/asset_path.dart';
import '../../utils/app_styles.dart';
import '../../widgets/custom_otp_button.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: Stack(
        children: [
        SizedBox(
        height: 844.h,
        width: 390.w,
        child: Image.asset(
          ImageAssetPath.loginScreen,
          fit: BoxFit.fill,
        )),
    Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    Container(
    width: 349.w,
   // alignment: Alignment.bottomCenter,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: AppStyles.white),

    child: Padding(
    padding:
    const EdgeInsets.only(top: 45),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('OTP Verification', style:AppStyles.verifystyle ),
    SizedBox(height: 15),
    Text('We have sent one-time\npasscode to your mobile number',textAlign: TextAlign.center, style:AppStyles.termstyle.copyWith(fontSize: 16.sp) ),
        SizedBox(height: 27.h),
        Container(
          height: 226.h,
          width: 349.w,
          decoration: BoxDecoration(
            color: AppStyles.lightgrey.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: 33, right: 124, left: 120),
                    child: Container(
                      height: 57.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppStyles.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    )
                ),

                //SizedBox(height: 35),
                Padding(
                  padding: EdgeInsets.only(
                      top: 32, right: 65, left: 66, bottom: 25),
                  child: Text.rich(TextSpan(
                  text: 'Didnot recieve code?',
                    style: AppStyles.termstyle.copyWith(fontSize: 15.sp),
                    children: [
                      TextSpan(
                        text: ' Resend',
                        style: AppStyles.verifystyle.copyWith(fontSize: 15.sp),
                      )
                    ]
                ))),
                CustomOtpButton(
                  text: 'VERIFY',
                  onPress: () {},
                )

    ]),
    )
    
  ] ))
    ),
      Padding(
          padding: EdgeInsets.only(
              top: 41, right: 68, left: 69, bottom: 63),
          child: Text.rich(TextSpan(
              text: 'By creating account you agree to our \n',
              style: AppStyles.termstyle,
              children: [
                TextSpan(
                    text: 'Terms of Service',
                    style: AppStyles.termstyle.copyWith(
                        color: AppStyles.black,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline),
                    children: [
                      TextSpan(
                          text: ' and ',
                          style: AppStyles.termstyle,
                          children: [
                            TextSpan(
                              text: 'Privacy Policy',
                              style: AppStyles.termstyle.copyWith(
                                  color: AppStyles.black,
                                  fontWeight: FontWeight.w600,
                                  decoration:
                                  TextDecoration.underline),
                            )
                          ])
                    ])
              ])))
    ])
        ]

    )
    )
    );
  }
}
