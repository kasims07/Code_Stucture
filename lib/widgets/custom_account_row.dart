import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/asset_path.dart';
import '../utils/app_styles.dart';

class CustomAccountRow extends StatelessWidget {
  String icon;
  double? height;
  double width;
  String text;
  double betwidth;
  CustomAccountRow({Key? key, required this.icon, required this.height, required
   this.width, required this.text, required this.betwidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(right:20.65 , left: 21.67.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(

              children: [
                SvgPicture.asset(icon, height: height, width: width),
                SizedBox(width:betwidth),
                Text(text, style:AppStyles.acfontstyle),
              ],
            ),
            SvgPicture.asset(ImageAssetPath.accountback, height: 10.71.h, width: 5.35.w),
          ],
        )
    );
  }
}
