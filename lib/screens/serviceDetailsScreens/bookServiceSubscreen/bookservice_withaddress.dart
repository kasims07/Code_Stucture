import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/asset_path.dart';
import '../../../utils/app_styles.dart';
import '../../../widgets/custom_account_backbutton.dart';
import '../../../widgets/custom_bottom_button.dart';
import '../../../widgets/custom_phone_textfield.dart';
import '../../../widgets/custom_textformfield.dart';
import '../../../widgets/custom_time_container.dart';


class BookServiceWithAddress extends StatelessWidget {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  BookServiceWithAddress({Key? key}) : super(key: key);

  List<dynamic> timelist = ['08:00', '10:00', '11:00', '12:00', '01:00', '02:00', '03:00'];


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body : SingleChildScrollView(
          child: Container (
            //height: 844.h,
              width: 390.w,
              color: AppStyles.black,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Row(children: [
                    CustomAccountBackbutton(),
                    SizedBox(width: 49.62.w),
                    Text('Full Home Deep Cleaning', style: AppStyles.profilestyle)
                  ],),
                  SizedBox(height: 2.h),
                  Text('Unfurnished Apartment classic', style: AppStyles.termstyle),
                  SizedBox(height: 6.h),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('1BHK', style: AppStyles.redstyle),
                        Image.asset(ImageAssetPath.dot,  height: 25.h,width: 41.w),
                        Text('₹ 2099', style:AppStyles.buttonstyle.copyWith(fontSize: 16.sp ) ,)
                      ]),
                  SizedBox(height: 15.h),
                  Container(
                      height: 691.h,
                      width : 390.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppStyles.white
                      ),
                      child:Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 21),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact Info', style: AppStyles.fontblackstyle.copyWith(fontSize: 15.sp),),
                              SizedBox(height: 15.h),
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
                              CustomPhoneField(
                                controller: numbercontroller,
                                type: TextInputType.number,
                                hintText: 'Mobile Number',
                                labelText: 'Mobile Number',
                              ),
                              SizedBox(height: 10.h),
                              Text('Your Address', style: AppStyles.homelogostyle.copyWith(fontSize: 15.sp),),
                              SizedBox(height: 10.h),
                              Container(
                                height: 77.h,
                                width: 350.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppStyles.backgroundcolor
                                ),
                                child: Padding(padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.h),
                                child: Row(children: [
                                      SvgPicture.asset(ImageAssetPath.bookLocation, height: 43.sp, width : 43.sp),
                                   SizedBox(width:10.w),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                     Text('Home', style: AppStyles.redstyle.copyWith(fontSize: 14.sp),),
                                     Text('1270 D Street Southfield, MI 48235 ', style: AppStyles.categorystyle.copyWith(fontWeight: FontWeight.w500),),
                                   ],),
                                  SizedBox(width: 60.w),
                                  SvgPicture.asset(ImageAssetPath.editIcon, height: 18.01.h,width: 18.02.w)
                                ],),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text('Select Date & Time Slot', style:AppStyles.homelogostyle.copyWith(fontSize: 15.sp) ,),
                              SizedBox(height: 16.h),
                              Container(
                                height: 55.h,
                                width: 350.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color:AppStyles.grey.withOpacity(0.20))
                                ),
                                child: Padding(padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical :5),
                                  child:

                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(children: [
                                        Text('Date', style: AppStyles.termstyle.copyWith(fontSize: 12.sp),),
                                        SizedBox(height: 2.h),
                                        Text('25 Jun, 2022', style : AppStyles.homelogostyle.copyWith(fontSize: 14.sp)),
                                      ],),
                                      SvgPicture.asset(ImageAssetPath.redbooking, height: 20.h, width: 18.w),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 19.h),
                              GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 15.0,
                                      mainAxisSpacing: 14.0
                                  ),
                                  itemCount: timelist.length,
                                  itemBuilder: (context, index){
                                    return Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: CustomTimeContainer(

                                        time: timelist[index],
                                      ),
                                    );
                                  }
                              ),
                              SizedBox(height: 5.h),
                              CustomBottomButton(
                                onPress: (){},
                                text: 'Request Send',),
                            ],
                          )
                      )
                  ),

                ],
              )
          ),
        )
    ));
  }
}
