import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfive/utils/app_styles.dart';

import '../constants/asset_path.dart';

class CustomNoteContainer extends StatelessWidget {
  String text1;
  String text2;
  CustomNoteContainer({Key? key, required this.text1, required this.text2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child:Row(
          children: [
              Image.asset(ImageAssetPath.notification,height: 52.h, width: 52.w),
             SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(text1, style: AppStyles.termstyle.copyWith(fontSize: 13.sp),),
              SizedBox(height: 10.h),
              Text(text2, style: AppStyles.redstyle.copyWith(fontSize: 10.sp, fontWeight: FontWeight.w400),),

            ],)
          ],
            )
    ),
          Divider(color:AppStyles.divider),
        ],
      );


  }
}
