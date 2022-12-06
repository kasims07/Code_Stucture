import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfive/utils/app_styles.dart';

class CustomClickableContainer extends StatelessWidget {
  String image;
  String text;
  Function onPress;
  CustomClickableContainer({Key? key, required this.image, required this.onPress, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress(),
      child: Container(
        height: 58.h,
        width: 350.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppStyles.bordercolor)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SvgPicture.asset(image, height: 19.h, width: 17.1.w),
          SizedBox(width: 8.9.w),
          Text(text, style:AppStyles.homelogostyle.copyWith(fontSize: 14.sp)),

        ],),
      ),
    );
  }
}
