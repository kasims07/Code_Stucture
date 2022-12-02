import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class AppStyles{

  static const red = Color(0xffED1C24);
  static const grey = Color(0xff7E879F);
  static const white = Color(0xffFFFFFF);
  static const lightgrey = Color(0xffF3F3F6);
  static const black = Color(0xff000000);
  static const fontgrey = Color(0xff9FA1AD);
  static const fontblack = Color(0xff060606);
  static const darkgradient = Color(0xffE8E8E8);
  static const fontcolorgrey = Color(0xffA0A5BA);
  static const divider = Color(0xffF0F4F9);



  //Textstyles
static TextStyle loginfont =  TextStyle(fontSize: 18.42.sp, fontWeight: FontWeight.w600, fontFamily: 'Vietnam');
static TextStyle hintstyle = TextStyle(fontSize: 20.sp, fontFamily: 'Vietnam',color: AppStyles.grey.withOpacity(0.3));
static TextStyle termstyle = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: 'Vietnam', color: AppStyles.grey);
static TextStyle verifystyle = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, fontFamily: 'Vietnam', color: AppStyles.black);
static TextStyle homelogostyle = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: 'Vietnam', color: AppStyles.black);
static TextStyle profilestyle = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, fontFamily:'Vietnam', color: AppStyles.white );
static TextStyle buttonstyle = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700, fontFamily: 'Vietnam', color: AppStyles.white);
static TextStyle interstyle = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, fontFamily: 'Inter', color: AppStyles.fontgrey);
static TextStyle redstyle = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: 'Vietnam', color: AppStyles.red);
static TextStyle searchstyle = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: 'Vietnam', color: AppStyles.white.withOpacity(0.5));
static TextStyle categorystyle = TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, fontFamily: 'Vietname', color: AppStyles.fontblack);
static TextStyle detailsstyle = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: 'Vietnam', color: AppStyles.fontcolorgrey);
static TextStyle detfontstyle = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: 'Vietnam', color: AppStyles.black);

}