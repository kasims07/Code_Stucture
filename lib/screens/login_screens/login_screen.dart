import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../constants/asset_path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _numcontroller =  TextEditingController();
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
            Positioned(
              top: 0,
              bottom: -50,
              right: 1,
              left: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 384.h,
                    width: 349.w,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppStyles.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 33, right: 43, left: 38),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Welcome to',
                                style: TextStyle(
                                    fontSize: 18.42.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Vietnam'),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '    G FIVE',
                                    style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Vietnam',
                                        color: AppStyles.red),
                                  ),
                                  Text(' Home Services',
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Vietnam'))
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                            'Start your bookservice using your\nmobile number',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Vietnam',
                                color: AppStyles.grey)),
                        Container(
                          height: 226.h,
                          width: 349.w,
                          decoration: BoxDecoration(
                              color: AppStyles.lightgrey.withOpacity(0.5)),
                          child: Column(
                            children: [
                              Padding(padding: EdgeInsets.only(top: 38, right: 124, left: 120),
                              child: Container(
                                height: 20.h,
                                width : 105.w,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppStyles.grey),
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppStyles.white
                                ),
                              ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only( top: 18, right: 69, left: 69),
                                child: TextFormField(
                                  controller: _numcontroller,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Mobile Number',
                                    hintStyle:TextStyle(fontSize: 20.sp, fontFamily: 'Vietnam',color: AppStyles.grey.withOpacity(0.3)),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 41, right: 65, left: 69, bottom: 63),
                  child: Text.rich(
                      TextSpan(
                        text:'By creating account you agree to our', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: 'Vietnam', color: AppStyles.grey),
                          children: [
                            TextSpan(
                              text: 'Terms of Service',style:TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, fontFamily: 'Vietnam', color: AppStyles.black,
                                                                        decoration: TextDecoration.underline),
                          children: [
                             TextSpan(
                               text: 'and',style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: 'Vietnam', color: AppStyles.grey),
                               children: [
                                 TextSpan(
                                   text: 'Privacy Policy',style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, fontFamily: 'Vietnam', color: AppStyles.black,
                                     decoration: TextDecoration.underline),
                                 )
                               ]
  )
]
                            )
                          ]
                      ))
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
