import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/asset_path.dart';
import '../utils/app_styles.dart';

class CustomChangeAddressContainer extends StatelessWidget {

  String text;
  String tickimage;
  String address;
  Function onDelete;

  CustomChangeAddressContainer({Key? key,required this.address, required this.onDelete, required this.text, required this.tickimage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

        padding: EdgeInsets.symmetric(horizontal: 13.h,vertical: 14.h),
      height: 130.h,
      width: 390.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppStyles.grey.withOpacity(0.05)
      ),
     // child: Padding(padding: EdgeInsets.symmetric(horizontal: 13.h,vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: AppStyles.redstyle.copyWith(fontSize: 14.sp),),

              SizedBox(height: 9.h),
              Container(
                padding: EdgeInsets.only(top: 13.sp, bottom: 14.sp, right: 17.67.sp, left: 12.sp),
                height: 72.h,
                width: 355.h,
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
                        Text(address, style: AppStyles.sfstyle),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(tickimage, height: 16.67.h,width: 16.67.h),
                        SizedBox(width: 15.w),
                        InkWell(
                            onTap: (){
                              onDelete!();
                            },
                            child: SvgPicture.asset(ImageAssetPath.trashIcon, height: 20.h, width: 20.h)),
                      ],
                    ),

                  ],
                ),
              )
            ],
          )



    );
  }
}
