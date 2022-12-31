

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_styles.dart';

class NoDataWidget extends StatelessWidget {

  const NoDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            'assets/nodata.json',
            height: 200.h,
            width: 200.w,
          ),

          Text(
            'No Booking Found',
            style: AppStyles.hintstyle,
          )
        ],
      ),
    );
  }
}