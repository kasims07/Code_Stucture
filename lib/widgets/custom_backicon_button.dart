import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/asset_path.dart';

class CustomBackIconButton extends StatelessWidget {
  Function onPress ;
  CustomBackIconButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: IconButton(
        onPressed: onPress(),
    icon: SvgPicture.asset(ImageAssetPath.backIcon, height: 100.h, width: 100.h,)
    ),
    );
  }
}
