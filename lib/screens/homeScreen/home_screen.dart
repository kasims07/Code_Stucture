import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../constants/asset_path.dart';
import '../../widgets/custom_textformfield.dart';


class HomeScreen extends StatelessWidget {
  TextEditingController searchcontroller = TextEditingController();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 920.h,
          width: 390.w,
          color: AppStyles.black,
          child:
            Column(
              children: [
                 SizedBox(height: 56),
                 Image.asset(ImageAssetPath.logo),
                SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  SvgPicture.asset(ImageAssetPath.locationIcon,height: 15.h, width: 12.75.w, color: AppStyles.grey),
                  Text(' Ahmedabad, 380062',style: AppStyles.profilestyle.copyWith(fontSize: 13, fontWeight: FontWeight.w400),)
                ],),
                SizedBox(height: 15),
                Text('Hello Jeson', style: AppStyles.redstyle),
                SizedBox(height: 5),
                Text('What service do you need?', style: AppStyles.profilestyle.copyWith(fontSize: 20.sp),),
                SizedBox(height: 19),
                Padding(padding: EdgeInsets.only(top: 19, right: 20, left: 20, bottom: 20),
                child:
                  Container(
                    height: 48,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    color:
                      AppStyles.white.withOpacity(0.15),),
                    child: TextFormField(
                      controller: searchcontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: AppStyles.searchstyle,
                        labelText: 'Search services',
                        labelStyle: AppStyles.searchstyle,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        border: InputBorder.none,
                        prefixIcon: Container(
                          height: 16.67.h,
                          width: 16.67.w,
                        child: Padding(padding: EdgeInsets.all(15),
                         child:SvgPicture.asset(ImageAssetPath.searchIcon,  color: AppStyles.white.withOpacity(0.5)),

                      ),
                    ),



                )
                )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),


    );
  }
}
