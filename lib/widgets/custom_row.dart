import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/asset_path.dart';
import '../utils/app_styles.dart';

class CustomRow extends StatelessWidget {
  String text;
  CustomRow({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SvgPicture.asset(ImageAssetPath.includedIcon, height: 13.13.h, width: 14.w, color: AppStyles.darkyellow),
      SizedBox(width: 7),
      Text(text, style: AppStyles.detfontstyle),
    ],);
  }
}
