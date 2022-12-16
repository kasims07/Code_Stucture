import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/constants/asset_path.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../../widgets/custom_account_backbutton.dart';
import '../../../widgets/custom_address_textfield.dart';
import '../../../widgets/custom_otp_button.dart';
import 'bloc/contact_uc_bloc.dart';

class ContactUs extends StatelessWidget {
  TextEditingController subjectcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  ContactUs({Key? key}) : super(key: key);

  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider<ContactUcBloc>(
          create: (_) => ContactUcBloc(),
        ),
      ],
      child: ContactUs(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children:[ Container(
            //height: 844.h ,
            //width: 390.h,
            color: AppStyles.black,
            child:Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    CustomAccountBackbutton(),
                    SizedBox(width: 102.62.w),
                    Text('Contact Us', style:AppStyles.profilestyle ),
                  ],
                ),
                SizedBox(height: 68.h),
                SvgPicture.asset(ImageAssetPath.gfiveIcon, height: 95.h, width: 109.h),
                SizedBox(height: 307.h),
                Container(
                  height: 297.h,
                  width: 390.w,
                  color: AppStyles.white,
                  child: Column(
                    children: [
                      SizedBox(height: 180.h),
                     Container(
                       height:73.h,
                       width: 350.w,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10.sp),
                         color: AppStyles.backgroundcolor,
                       ),
                       child:Padding(padding: EdgeInsets.only(top: 13.sp, bottom: 11.sp),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Row(
                             mainAxisAlignment:MainAxisAlignment.center,
                             children: [
                             SvgPicture.asset(ImageAssetPath.phoneIcon, height: 22.75.h, width: 22.75.w),
                             SizedBox(width: 6.62.w),
                             Text('+91-99998 59885'),
                           ],),
                           SizedBox(height: 4),
                           Text('Call for support',style: AppStyles.detailsstyle.copyWith(color: AppStyles.bottomnavigationcolor), )

                         ],
                       ),
                       )
                     )
                    ],
                  ),
                )

              ],
            )
          ),
      Positioned(
        //top: 50,
        right:38,
        bottom: 120,
        child: Container(
          //height:430.h ,
        width: 349.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppStyles.white
        ),
          child: Column(
            children: [
          Padding(padding: EdgeInsets.only(top: 20, right: 21, left: 21),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please fill in the below if you have any enquiries. We endeavour to get back to you within 24 hours.',textAlign: TextAlign.center, style: AppStyles.detailsstyle.copyWith(color: AppStyles.bottomnavigationcolor),),
            SizedBox(height: 20),
              CustomAddressTextfield(
                controller: subjectcontroller, type: TextInputType.text, hintText: 'Subject',labelText: 'Subject',),
              SizedBox(height: 10),
              CustomAddressTextfield(
                controller: emailcontroller, type: TextInputType.emailAddress, hintText: 'Email',labelText : 'Email'),
              SizedBox(height: 10),

            Container(
              height: 118.h,
              width: 350.w,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppStyles.grey.withOpacity(0.2)
                  )
                // border: Border.all(color: )
              ),
              child: Padding(
                //padding: EdgeInsets.symmetric(horizontal: 0.5.h).copyWith(top: 0.5.h, bottom: 0.5.h),
                padding: EdgeInsets.only(top: 2.h, bottom: 70.h, left: 10.w),

                child: Center(
                  child: TextFormField(
                    //textAlign: TextAlign.center,
                    //textAlignVertical: TextAlignVertical.center,
                    controller: descriptioncontroller,
                    keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 5,
                    // maxLength: maxlength,
                    textInputAction: TextInputAction.next,

                    // inputFormatters: format == 'normal'? [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s"),)
                    // ] : inputFormatters, style: AppStyles.verifystyle.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      alignLabelWithHint: true,

                      counterText:'',
                      //isDense: true,
                      hintText: 'Description',
                      hintStyle: AppStyles.termstyle,
                      // labelText: labelText,
                      labelStyle: AppStyles.termstyle,

                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      border: InputBorder.none,


                    ),

                  ),
                ),
              ),
            )
              ]),
          ),
              SizedBox(height: 22),
              CustomOtpButton(
                text: 'SUBMIT',
                onPress: ()
    {
      },
              )

            ],
          ),
          ),
        ),

          ]
      ),
      ),
    ));
  }
}
