import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../constants/asset_path.dart';
import '../../widgets/custom_textformfield.dart';

class ProfileScreen extends StatelessWidget {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 844.h,
          width: 464.w,
          color: AppStyles.black,
          child: 
          Padding(padding: EdgeInsets.only(top: 49),
          child: Column(children: [
            Text('Complete Profile',style: AppStyles.profilestyle,),
             SizedBox(height: 17),
            Text('Enter your personal details for easy to\nbook & fast', textAlign: TextAlign.center, style: AppStyles.termstyle.copyWith(fontSize: 15.sp),),
          SizedBox(height: 26),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 686.h,
                width: 390.w,
                decoration: BoxDecoration(
                  color: AppStyles.white, borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(padding: EdgeInsets.all(20),

                child: Column(
                  children: [
                    CustomTextformfield(
                      controller: namecontroller,
                      icon: SvgPicture.asset(
                          ImageAssetPath.profileIcon,height: 20.01.h,width: 16.w,
                      ),
                       hintText: 'Enter your name',
                      labelText: 'Full Name',
                      type: TextInputType.text,
                    ),
                    SizedBox(height: 15),
                    CustomTextformfield(
                      controller: emailcontroller,
                      icon: SvgPicture.asset(
                          ImageAssetPath.emailIcon,height: 18.h,width: 20.w,
                      ),
                      hintText: 'Enter your email ',
                      labelText: 'Email',
                      type: TextInputType.emailAddress,
                    ),
                  ],
                ),
                ),
              ),
            )

          ],)
          )
          
              
            
          ),
      ),
      ),

    );
  }
}
