import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/app_screens/app_screens.dart';
import 'package:gfive/screens/otpScreen/verification_screen.dart';
import 'package:gfive/utils/app_styles.dart';

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
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppStyles.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 33, right: 43, left: 38),
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
                      Text('Start your bookservice using your\nmobile number',
                          textAlign: TextAlign.center,
                          style: AppStyles.hintstyle),
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
                                    top: 38, right: 124, left: 120),
                                child: InkWell(
                                  onTap: () {
                                    showCountryPicker(
                                      context: context,
                                      //countryFilter: <String>['IN', 'IT'],
                                      favorite: <String>['IT'],
                                      showPhoneCode: true,
                                      onSelect: (Country country) {
                                        String countryCode =
                                            ' (+${country.phoneCode})';
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
                                    );
                                  },
                                  child: Container(
                                    height: 47.h,
                                    width: 105.w,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: AppStyles.grey),
                                        borderRadius: BorderRadius.circular(50),
                                        color: AppStyles.white),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 18, right: 69, left: 69),
                              child: TextFormField(
                                controller: _numcontroller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Mobile Number',
                                  hintStyle: AppStyles.hintstyle,
                                ),
                              ),
                            ),SizedBox(height: 12),
                            CustomOtpButton(
                              text: 'GET OTP',
                              onPress: () {
                              Navigator.pushNamed(context, AppScreens.otpVerification);
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
