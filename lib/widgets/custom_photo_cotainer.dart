import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/asset_path.dart';

class CustomPhotoContainer extends StatelessWidget {
  String imagepath;
  CustomPhotoContainer({Key? key, required this.imagepath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 2.2.w),
      // child: Container(
      //   height:79,
      //     width:79,
      //    decoration: BoxDecoration(
      //      borderRadius: BorderRadius.circular(5),
      //      ),
        child:
        Image.asset(imagepath,height: 79, width: 79),

      );

  }
}
