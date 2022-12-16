import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/app_screens/app_screens.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../constants/asset_path.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_textformfield.dart';


class HomeScreen extends StatelessWidget {
  TextEditingController searchcontroller = TextEditingController();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppStyles.black,
          child:
            SingleChildScrollView(
              child: Column(
                children: [
                   SizedBox(height: 36),
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
                  Padding(padding: EdgeInsets.only(top: 19, right: 20, left: 20, bottom: 0),
                  child:
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      color:
                        AppStyles.white.withOpacity(0.15),),
                      child: TextFormField(
                        controller: searchcontroller,
                        keyboardType: TextInputType.text,

                        style: TextStyle(color: AppStyles.white.withOpacity(0.5)),
                        textAlignVertical: TextAlignVertical.center,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: 'Search services',
                          hintStyle: AppStyles.searchstyle,
                          labelStyle: AppStyles.searchstyle,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          border: InputBorder.none,
                          isCollapsed: true,

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
                  SizedBox(height: 20),
                  Container(
                    width:390.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                       ),

                      color: AppStyles.white
                    ),
                    child: Padding(padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: Column(children: [
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, AppScreens.serviceDetails);
                          },
                          child: Container(
                            height: 163.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppStyles.grey.withOpacity(0.16)),

                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                    top:18,
                                left:-10,
                                    child: Image.asset(ImageAssetPath.homeLogo, height: 145.h, width: 372.w)),
                                Positioned(
                                    top: 15,
                                    right:30,

                                    child: Text('Full Home\nDeep Cleaning',style: AppStyles.homelogostyle ,))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            CustomContainer(
                              text: 'Kitchen\nCleaning',
                              imagePath: ImageAssetPath.kitchenLogo,
                              imageHeight: 74.75.h,
                              imageWidth: 88.1.w,
                              topPadding: 16.20.h,
                              botPadding: 16.h,
                            ),
                            SizedBox(width:15.w),
                            CustomContainer(
                              text: 'Bathroom\nCleaning',
                              imagePath: ImageAssetPath.bathroomLogo,
                              imageHeight: 76.h,
                              imageWidth: 79.8.w,
                              topPadding: 18.h,
                              botPadding: 16.h,
                            ),
                            SizedBox(width:15.w),
                            CustomContainer(
                              text: 'Sofa\nShampooing',
                              imagePath: ImageAssetPath.sofaLogo,
                              imageHeight: 78.96.h,
                              imageWidth: 91.05.w,
                              topPadding: 20.99.h,
                              botPadding: 16.h,
                            ),

                        ],),
                        SizedBox(height: 15.h),
                        Row(children: [

                        CustomContainer(
                        text: 'Carpet\nShampooing',
                          imagePath: ImageAssetPath.carpet,
                          imageHeight:73.63.h,
                          imageWidth:94.95.w,
                          topPadding: 21.56.h,
                          botPadding: 16.h,
                        ),
                          SizedBox(width:15.w),
                          CustomContainer(
                            text: 'Metress\nShampooing',
                            imagePath: ImageAssetPath.metress,
                            imageHeight: 64.05.h,
                            imageWidth: 90.w,
                            topPadding: 28.98.h,
                            botPadding: 16.h,
                          ),
                          SizedBox(width:15.w),
                          CustomContainer(
                            text: 'Marble\nPolish',
                            imagePath: ImageAssetPath.marblepolish,
                            imageHeight: 86.4.h,
                            imageWidth: 92.w,
                            topPadding: 24.h,
                            botPadding: 16.h,
                          ),
                          SizedBox(height: 15.w),
                         ],)
                      ],),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),


    );
  }
}
