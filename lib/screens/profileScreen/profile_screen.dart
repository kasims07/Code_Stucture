import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/app_screens/app_screens.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../constants/asset_path.dart';
import '../../widgets/custom_bottom_button.dart';
import '../../widgets/custom_textformfield.dart';
import 'bloc/profile_screen_bloc.dart';


class ProfileScreen extends StatelessWidget {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  ProfileScreen({Key? key}) : super(key: key);

  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileScreenBloc>(
          create: (_) => ProfileScreenBloc(),
        ),
      ],
      child:  ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
backgroundColor: AppStyles.white,
      body:
      SingleChildScrollView(
        child: Container(
          height: 750.h,
          width: 464.w,
          color: AppStyles.black,
          child: 
          Padding(padding: EdgeInsets.only(top: 49),
          child: Column(children: [
            Text('Complete Profile',style: AppStyles.profilestyle,),
             SizedBox(height: 17),
            Text('Enter your personal details for easy to\nbook & fast', textAlign: TextAlign.center, style: AppStyles.termstyle.copyWith(fontSize: 15.sp),),
          SizedBox(height: 26),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                //height: 686.h,
               // width: 390.w,
                decoration: BoxDecoration(
                  color: AppStyles.white, 
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10) ),
                  border: Border.all(color: AppStyles.white)
                ),
                child: Padding(padding: EdgeInsets.all(20),

                child: Column(
                  children: [
                    CustomTextformfield(
                      controller: namecontroller,
                      icon: Container(
                       padding: EdgeInsets.all(12.h),
                        child: SvgPicture.asset(
                            ImageAssetPath.profileIcon,
                        ),
                      ),
                       hintText: 'Enter your name',
                      labelText: 'Full Name',
                      type: TextInputType.text,

                    ),
                    SizedBox(height: 15),
                    CustomTextformfield(
                      controller: emailcontroller,
                      icon: Container(
                        padding: EdgeInsets.all(12.h),
                        child: SvgPicture.asset(
                          ImageAssetPath.emailIcon,
                        ),
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
      bottomNavigationBar:
      Container(
        height: 100,
       decoration: BoxDecoration(
         color: AppStyles.white,
         border: Border.all(
           color: Colors.transparent
         )
       ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomBottomButton(
                  text:'SUBMIT',
                  onPress: (){
                    Navigator.pushNamed(context, AppScreens.dashboardScreen);
                  }
              ),
              SizedBox(height: 16),
              Text('Skip', style: AppStyles.interstyle),
              SizedBox(height: 10),
            ]),
      ),

      ),

    );
  }
}
