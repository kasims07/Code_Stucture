import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/utils/app_styles.dart';

class CustomBottomButton extends StatelessWidget {
  String? text;
  Function? onPress;

  CustomBottomButton({Key? key, required this.onPress, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPress!();
      },
      child:Container(
        height : 55.h,
        width:350.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppStyles.red
        ),
        child:Center(
          child: Text('${text!}', style: AppStyles.buttonstyle ),
        )
      )
    );
  }
}
