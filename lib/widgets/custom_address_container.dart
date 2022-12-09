import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/constants/asset_path.dart';
import 'package:gfive/utils/app_styles.dart';

class CustomAddressContainer extends StatelessWidget {
  String text;
  String tickimage;
  CustomAddressContainer({Key? key, required this.text, required this.tickimage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 350.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppStyles.grey.withOpacity(0.05)
      ),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 13.h,vertical: 14.h),
      child: Column(
        children: [
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(text, style: AppStyles.redstyle.copyWith(fontSize: 14.sp),),
             Row(
               children: [
             SvgPicture.asset(ImageAssetPath.editIcon, height: 15.01.h, width: 15.02.h),
              SizedBox(width: 13.18),
              SvgPicture.asset(ImageAssetPath.trashIcon, height: 20.h, width: 20.h),
          ],),
            ],
          ),
          SizedBox(height: 9.h),
          Container(
            padding: EdgeInsets.only(top: 15.sp, bottom: 14.sp, right: 29.67.sp, left: 12.sp),
            height: 72.h,
            width: 324.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppStyles.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                SvgPicture.asset(ImageAssetPath.bookLocation, height: 43.h, width: 43.w),
                SizedBox(width: 8.w),
                Text('1270 D Street Southfield\nMI 48235 ', style: AppStyles.sfstyle),
                  ],
                ),
               SvgPicture.asset(tickimage, height: 16.67.h,width: 16.67.h),

              ],
            ),
          )
        ],
      )
      ),


    );
  }
}
