import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/asset_path.dart';

class CustomAccountBackbutton extends StatelessWidget {
  const CustomAccountBackbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){},
        icon: SvgPicture.asset(ImageAssetPath.backIcon, height: 100.h, width: 100.h,)
    );
  }
}
