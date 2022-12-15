import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/asset_path.dart';
import '../utils/app_styles.dart';

class CustomServiceContainer extends StatelessWidget {
  String text;
  CustomServiceContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 59.h,
        width: 318.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:AppStyles.servicecontainercolor
        ),
        child: Row(children: [
          Container(
            height: 59.h,
            width: 5.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)), color: AppStyles.black
            ),

          ),
          SizedBox(width: 10.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: AppStyles.detfontstyle),
              SizedBox(width: 50.w),
              SvgPicture.asset(ImageAssetPath.serviceIcon, height: 6.h, width : 10.67.w),
            ],
          ),

        ],),
      ),
    );
  }
}
