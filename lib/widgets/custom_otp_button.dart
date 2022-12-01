import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_styles.dart';

class CustomOtpButton extends StatelessWidget {
  String? text;
  Function? onPress;
   CustomOtpButton({Key? key, this.text, this.onPress }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPress!();
      },
      child: Container(
        height: 55.h,
        width: 350.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15)
            ),
          color: AppStyles.red
        ),
        child: Center(
          child: Text('${text!}', style:AppStyles.buttonstyle),
        ),
      ),
    );
  }
}
