import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/asset_path.dart';

class CustomAccountBackbutton extends StatelessWidget {
  Function? onTap;
  bool? isFunction;
   CustomAccountBackbutton({Key? key, this.onTap, this.isFunction = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){
          if(isFunction == true){
            onTap!();
          }else{
            Navigator.pop(context);
          }
        },
        icon: SvgPicture.asset(ImageAssetPath.backIcon, height: 100.h, width: 100.h,)
    );
  }
}
