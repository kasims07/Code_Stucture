import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../app_screens/app_screens.dart';
import '../../constants/asset_path.dart';
import '../../widgets/custom_account_row.dart';

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
                 SizedBox(height: 20),
                 Text('Account', style: AppStyles.profilestyle),
                 SizedBox(height: 93),

                 Container(
                 height: 246.h,
                 width: 390.w,
                 decoration: BoxDecoration(
                   color: AppStyles.white,
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(15),
                     topRight: Radius.circular(15),
                   ),
                   border: Border.all(color: AppStyles.white, width: 0)
                 ),
                   child : Column(
                     children:[
                       SizedBox(height: 83.h),
                       Text('Jeson Roy', style: AppStyles.verifystyle),
                       SizedBox(height: 42),

                       InkWell(
                         onTap: (){
                           Navigator.pushNamed(context, AppScreens.editProfile);
                         },
                         child: CustomAccountRow(
                           text :'Edit Profile',
                           icon: ImageAssetPath.editProfile,
                           height: 14.26.h,
                           width: 14.27.w,
                           betwidth: 12.36,
                         ),
                       ),
                       SizedBox(height: 31),
                       InkWell(
                         onTap: (){
                           Navigator.pushNamed(context, AppScreens.manageAddress);
                         },
                         child: CustomAccountRow(
                           text :'Manage Address',
                           icon: ImageAssetPath.manageIcon,
                           height: 16.25.h,
                           width: 16.25.w,
                           betwidth: 11.66,
                         ),
                       ),
                     ],

                   )
                   ),
                 Container(
                   height: 385.h,
                   width: 390.w,

                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.transparent, width: 0),
                     color: AppStyles.backgroundcolor,
                   ),
                   child: Column(children: [
                     SizedBox(height: 26),
                     CustomAccountRow(
                       text: 'Rate App',
                       icon: ImageAssetPath.rateIcon,
                       height: 15.83.h,
                       width: 16.67.w,
                       betwidth: 11.66,
                     ),
                     SizedBox(height: 30),
                   CustomAccountRow(
                     text: 'Share App',
                     icon: ImageAssetPath.shareIcon,
                     height: 16.67.h,
                     width: 16.66.w,
                     betwidth: 11.67,
                   ),
                     SizedBox(height: 30),
                     InkWell(
                       onTap: (){
                         Navigator.pushNamed(context, AppScreens.termsAndConditions);
                       },
                       child: CustomAccountRow(
                         text: 'Terms & Conditions',
                         icon: ImageAssetPath.termsIcon,
                         height: 16.67.h,
                         width: 14.17.w,
                         betwidth: 12.92,
                       ),
                     ),
                     SizedBox(height: 30),
                     InkWell(
                       onTap: (){
                         Navigator.pushNamed(context, AppScreens.privacyPolicy);
                       },
                       child: CustomAccountRow(
                         text: 'Privacy Policy',
                         icon: ImageAssetPath.privacyIcon,
                         height: 16.75.h,
                         width: 14.07.w,
                         betwidth: 12.97,
                       ),
                     ),
                     SizedBox(height: 30),
                     InkWell(
                       onTap: (){
                         Navigator.pushNamed(context, AppScreens.aboutUs);
                       },
                       child: CustomAccountRow(
                         text: 'About Us',
                         icon: ImageAssetPath.aboutUs,
                         height: 16.h,
                         width: 16.w,
                         betwidth: 12,
                       ),
                     ),
                     SizedBox(height: 30),
                     InkWell(
                       onTap: (){
                         Navigator.pushNamed(context, AppScreens.contactUs);
                       },
                       child: CustomAccountRow(
                         text: 'Contact Us',
                         icon: ImageAssetPath.contactus ,
                         height: 14.17.h,
                         width: 16.67.w,
                         betwidth: 11.67,
                       ),
                     ),
                     SizedBox(height: 28),
                   Padding(padding: EdgeInsets.only(right:20.65 , left: 20.sp),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Row(

                             children: [
                               SvgPicture.asset(ImageAssetPath.login, height: 20.h, width:20.w),
                               SizedBox(width:11.66.w),
                               Text('Logout', style:AppStyles.logoutfontstyle),
                             ],
                           ),
                           SvgPicture.asset(ImageAssetPath.accountback, height: 10.71.h, width: 5.35.w),
                         ],
                       )
                   ),
                   ],),
                 )
                 ]),
                 Positioned(
                     top: 75,
                     right: 125,
                     child: Container(
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         // image: DecorationImage(image: Image.asset(ImageAssetPath.accountImage))
                       ),
                       child: Image.asset(ImageAssetPath.accountImage, height: 129.h, width: 129.w),
                     )),
               ],
             ),
        ),
      ),
    ));
  }
}
