import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../utils/app_styles.dart';

class ButtonLoaderWidget extends StatelessWidget {

  const ButtonLoaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 40.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppStyles.red,
      ),

      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: AppStyles.red,
          color: AppStyles.white,
        )
      ),
    );
  }
}