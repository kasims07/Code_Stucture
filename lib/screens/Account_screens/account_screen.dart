import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../constants/asset_path.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //height:844.h ,
          width: 390.w ,
           color: AppStyles.black,
           child: Stack(
             children: [Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 SizedBox(height: 49),
                 Text('Account', style: AppStyles.profilestyle),
                 SizedBox(height: 100),
                 Positioned(
                     top: -10,
                     right: 20,
                     child: Container(
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         // image: DecorationImage(image: Image.asset(ImageAssetPath.accountImage))
                       ),
                       child: Image.asset(ImageAssetPath.accountImage, height: 129.h, width: 129.w),
                     )),
                 Container(
                 height: 700.h,
                 width: 390.w,
                 decoration: BoxDecoration(
                   color: AppStyles.white,
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(15),
                     topRight: Radius.circular(15),
                   )
                 ),
                   )
               ],
             ),
          ]
           ),
        ),
      ),
    ));
  }
}
