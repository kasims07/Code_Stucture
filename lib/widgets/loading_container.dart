import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../utils/app_styles.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: 844.h,
        color: Colors.transparent,
        child: Center(
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 CircularProgressIndicator(
                  color: AppStyles.red,
                   strokeWidth: 4.h,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  'Please wait..',
                  style: AppStyles.termstyle
                      .copyWith(fontSize: 12.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
