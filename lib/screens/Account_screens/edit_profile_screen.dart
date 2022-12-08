import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../constants/asset_path.dart';
import '../../widgets/custom_bottom_button.dart';
import '../../widgets/custom_phone_textfield.dart';
import '../../widgets/custom_textformfield.dart';

class EditProfileScreen extends StatelessWidget {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();

  EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //height: 844.h,
          width: 390.w,
          color: AppStyles.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            SizedBox(height: 49.h),
            Row(children: [
              IconButton(
                  onPressed: (){},
                  icon: SvgPicture.asset(ImageAssetPath.backIcon, height: 100.h, width: 100.h,)
              ),
              Text('Edit Profile',textAlign: TextAlign.center, style: AppStyles.profilestyle),
            ],),
            SizedBox(height: 24.h),
            Container(
              height: 721.h,
              width: 390.w,
              decoration: BoxDecoration(
                color: AppStyles.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 35, right: 20, left: 20, bottom: 24),
              child: Column(children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle
                          ),
                          child: Image.asset(ImageAssetPath.accountImage, height: 91.h, width: 91.w),
                        ),
                        Positioned(
                          top: 55,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle
                              ),
                              child: SvgPicture.asset(ImageAssetPath.cameraIcon, height: 31.h, width: 31.w),
                            ),

                          )
                     ],
                    ),
                SizedBox(height: 20),
            CustomTextformfield(
              controller: namecontroller,
              type: TextInputType.text,
              icon: Container(
                  padding: EdgeInsets.all(12.h),
                  child: SvgPicture.asset(
                      ImageAssetPath.profileIcon,),),
              hintText: 'Full Name',
              labelText: 'Full Name',
            ),
          SizedBox(height: 15.h),
                CustomPhoneField(
                  controller: numbercontroller,
                  type: TextInputType.number,
                  hintText: 'Mobile Number',
                  labelText: 'Mobile Number',


                ),
          SizedBox(height: 15.h),
          CustomTextformfield(
            controller: emailcontroller,
            type:TextInputType.emailAddress,
            icon: Container(
              padding: EdgeInsets.all(12.h),
              child: SvgPicture.asset(
                ImageAssetPath.emailIcon,),),
            hintText: 'Email ',
            labelText: 'Email',
          ),

               SizedBox(height : 297.h),
                CustomBottomButton(
                  onPress: (){},
                  text: 'UPDATE',
                ),

              ],),
              )
            )
          ],),
        ),
      ),
    ));
  }
}
