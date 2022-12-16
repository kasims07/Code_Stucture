import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfive/utils/app_styles.dart';

import '../constants/asset_path.dart';

class CustomNumberfield extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  String hintText;
  String labelText;


  final String? format;
  final List<TextInputFormatter>? inputFormatters;
  CustomNumberfield({Key? key, required this.controller,required this.type, required this.hintText, required this.labelText, this.format, this.inputFormatters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 1.h).copyWith(top: 0.5.h, bottom: 0.5.h),
          child:Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0.2.sp),
                        child: SvgPicture.asset(
                          ImageAssetPath.numberIcon,height: 21, width: 13.88,
                        ),
                      ),
                      SizedBox(width: 15.06.w),
                      Text('+91', style: AppStyles.detfontstyle),
                       ]
                      )
              ),
              Flexible(
                flex: 3,
                child: TextFormField(
                  controller: controller,
                  keyboardType: type,
                  maxLength: 10,
                  textInputAction: TextInputAction.next,

                  inputFormatters: format == 'normal'? [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s"),)
                  ] : inputFormatters, style: AppStyles.verifystyle.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    counterText: '',

                    isDense: true,
                    hintText: hintText,
                    hintStyle: AppStyles.termstyle,
                    labelText: labelText,
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
            ],
          )
      ),
    );
  }
}
