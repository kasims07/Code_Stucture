import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/asset_path.dart';
import '../utils/app_styles.dart';

class CustomContainer extends StatelessWidget {
  String text;
  String imagePath;
  double imageHeight;
  double imageWidth;
  //double height;
  double topPadding;
  double botPadding;

  CustomContainer({Key? key, required this.text, required this.imagePath, required this.imageHeight, required this.imageWidth,  required this.topPadding, required this.botPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          height:163.h,
          width: 107.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin:Alignment.bottomCenter ,
                end: const Alignment(0.5,0),
                colors: [
                   AppStyles.darkgradient,
                   AppStyles.white
                ]),
              border: Border.all(color:AppStyles.grey.withOpacity(0.16) ),
              borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: EdgeInsets.only(top: topPadding, bottom: botPadding),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(imagePath, height: imageHeight, width:imageWidth),
                //SizedBox(height: height),
                Text(text, style: AppStyles.categorystyle, textAlign: TextAlign.center,),
              ],),
          ),
        ));
  }
}
