import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/app_screens/app_screens.dart';
import 'package:gfive/screens/otpScreen/verification_screen.dart';
import 'package:gfive/utils/app_styles.dart';
import 'package:gfive/utils/stream_builder.dart';

import '../../constants/asset_path.dart';
import '../../widgets/custom_otp_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _numcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String countryCode;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: 844.h,
                  width: 390.w,
                  child: Image.asset(
                    ImageAssetPath.loginScreen,
                    fit: BoxFit.fill,
                  )),
              Positioned(
                top: 320.h,
                right: 0.w,
                left: 0.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              padding:
                                  const EdgeInsets.only(top: 33, right: 33, left: 38),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Welcome to',
                                    style: AppStyles.homelogostyle.copyWith(fontSize: 18.42.sp)
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '    G FIVE',
                                        style: AppStyles.redstyle.copyWith(fontSize: 22.sp, fontWeight:FontWeight.w800)
                                      ),
                                      Text(' HOME SERVICES',
                                          style: AppStyles.verifystyle.copyWith(fontSize: 22.sp, fontWeight:FontWeight.w800 ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Start your bookservice using your\nmobile number',
                                textAlign: TextAlign.center,
                                style: AppStyles.termstyle),
                            SizedBox(height: 15.h),
                            Container(
                             // height: 226.h,
                              width: 349.w,
                              decoration: BoxDecoration(
                                color: AppStyles.lightgrey,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 28, right: 124, left: 120),
                                      child: InkWell(
                                        onTap: () {
                                         /* showCountryPicker(
                                            context: context,
                                            //countryFilter: <String>['IN', 'IT'],
                                            favorite: <String>['IN'],
                                            showPhoneCode: true,
                                            onSelect: (Country country) {
                                              String countryCode =
                                                  ' (+${country.phoneCode})';
                                              StreamUtil.countrycode.add(country.phoneCode);
                                            },
                                            // Optional. Sets the theme for the country list picker.
                                            countryListTheme: CountryListThemeData(
                                              flagSize: 25.0,
                                              bottomSheetHeight: 550,
                                              textStyle: AppStyles.termstyle.copyWith(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppStyles.black),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                              ),
                                              // Optional. Styles the search field.
                                              inputDecoration: InputDecoration(
                                                labelText: 'Search',
                                                hintText: 'Start typing to search',
                                                prefixIcon: const Icon(Icons.search),
                                                fillColor: AppStyles.white,
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: const Color(0xFF8C98A8)
                                                          .withOpacity(0.2),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(25.0)),
                                              ),
                                            ),
                                          );*/
                                        },
                                        child: StreamBuilder<String>(
                                          stream: StreamUtil.countrycode,
                                          builder: (context, snapshot) {
                                            return Container(
                                              height: 47.h,
                                              width: 105.w,
                                              decoration: BoxDecoration(
                                                  border:
                                                      Border.all(color : AppStyles.grey.withOpacity(0.15)),
                                                  borderRadius: BorderRadius.circular(50),
                                                  color: AppStyles.white),
                                              child: Center(child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(ImageAssetPath.icIndia),
                                                  SizedBox(width: 5.w,),
                                                  Text('+91', style: AppStyles.verifystyle.copyWith(fontSize: 24.sp)),
                                                ],
                                              )),
                                            );
                                          }
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, right: 69, left: 69),
                                    child: TextFormField(
                                      controller: _numcontroller,
                                      keyboardType: TextInputType.number,
                                      maxLength: 10,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r"[0-9]"),
                                        )
                                      ],
                                      decoration: InputDecoration(
                                        counterText: '',
                                        border: InputBorder.none,
                                        hintText: 'Enter Mobile Number',
                                        hintStyle: AppStyles.hintstyle.copyWith(fontWeight: FontWeight.w700),
                                       ),
                                    style: AppStyles.homelogostyle.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomOtpButton(
                                    text: 'GET OTP',
                                    onPress: () {
                                    Navigator.pushNamed(context, AppScreens.otpVerification,
                                        arguments: {
                                           'mobileNum': _numcontroller.text.toString(),
                                            });
                                     },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: 41, bottom: 63),
                          child:
                              Column(
                                children: [
                                  Text('By creating account you agree to our', style:AppStyles.termstyle),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    Text('Terms of Service', style: AppStyles.verifystyle.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, decoration: TextDecoration.underline),),
                                    Text(' and ', style:AppStyles.termstyle ),
                                    Text('Privacy Policy', style: AppStyles.verifystyle.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, decoration: TextDecoration.underline),),
                                  ],)
                                ],
                              )
                      )
                      ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
