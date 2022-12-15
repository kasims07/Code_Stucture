import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_styles.dart';

class CustomAddressTextfield extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  String hintText;
  // String labelText;
  //int maxline;
  //int maxlength;

  // Widget icon;
  // final String? format;
  // final List<TextInputFormatter>? inputFormatters;


  CustomAddressTextfield({Key? key, required this.controller,required this.type, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 55.h,
        width: 350.w,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: AppStyles.grey.withOpacity(0.2)
            )
          // border: Border.all(color: )
        ),
        child: Padding(
          //padding: EdgeInsets.symmetric(horizontal: 0.5.h).copyWith(top: 0.5.h, bottom: 0.5.h),
          padding: EdgeInsets.only(top: 10.h, bottom: 12.h, left: 10.w),

          child: Center(
            child: TextFormField(
              //textAlign: TextAlign.center,
              //textAlignVertical: TextAlignVertical.center,
              controller: controller,
              keyboardType: type,
              minLines: 1,
              maxLines: 5,
              // maxLength: maxlength,
              textInputAction: TextInputAction.next,

              // inputFormatters: format == 'normal'? [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s"),)
              // ] : inputFormatters, style: AppStyles.verifystyle.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                isCollapsed: true,
                alignLabelWithHint: true,

                counterText:'',
                //isDense: true,
                hintText: hintText,
                hintStyle: AppStyles.termstyle,
                // labelText: labelText,
                labelStyle: AppStyles.termstyle,

                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                border: InputBorder.none,


              ),

            ),
          ),
        ),
      );
  }
}
