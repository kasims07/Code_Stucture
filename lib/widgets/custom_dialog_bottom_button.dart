import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_styles.dart';

class CustomDialogBottomButton extends StatelessWidget {
  Function onPress;
  String title;
  CustomDialogBottomButton({Key? key, required this.onPress, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
         onPress();
        },
        child:Container(
            height : 55.h,
            width:350.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppStyles.red
            ),
            child:Center(
              child: Text(title, style: AppStyles.buttonstyle ),
            )
        )
    );
  }
}
