import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfive/utils/app_routers.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../../app_screens/app_screens.dart';
import '../../../constants/asset_path.dart';
import '../../../widgets/custom_account_backbutton.dart';
import '../../../widgets/custom_bottom_button.dart';
import '../../../widgets/custom_dialog_bottom_button.dart';
import '../../../widgets/custom_numberfield.dart';
import '../../../widgets/custom_phone_textfield.dart';
import '../../../widgets/custom_textformfield.dart';
import '../../../widgets/custom_time_container.dart';
import 'bloc/login_book_service_bloc.dart';

class LoginBookServiceScreen extends StatelessWidget {

  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();

  LoginBookServiceScreen({Key? key}) : super(key: key);

  List<dynamic> timelist = [
    '08:00',
    '10:00',
    '11:00',
    '12:00',
    '01:00',
    '02:00',
    '03:00'
  ];

  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBookServiceBloc>(
          create: (_) => LoginBookServiceBloc(),
        ),
      ],
      child: LoginBookServiceScreen(),
    );
  }

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
                  SizedBox(height: 10),
                  Row(children: [
                    CustomAccountBackbutton(),
                    SizedBox(width: 49.62.w),
                    Text('Full Home Deep Cleaning',
                        style: AppStyles.profilestyle)
                  ],),
                  SizedBox(height: 2.h),
                  Text('Unfurnished Apartment classic',
                      style: AppStyles.termstyle),
                  SizedBox(height: 6.h),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('1BHK', style: AppStyles.redstyle),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            height: 8.h,
                            width: 8.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppStyles.white
                            ),
                          ),
                        ),
                        Text('₹ 2099', style: AppStyles.buttonstyle.copyWith(
                            fontSize: 16.sp),)
                      ]),
                  SizedBox(height: 15.h),
                  Container(
                      height: 691.h,
                      width: 390.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)
                          ),
                          color: AppStyles.white
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(top: 21, right: 20, bottom: 15, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact Info', style: AppStyles
                                  .fontblackstyle.copyWith(fontSize: 15.sp),),
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
                              SizedBox(height: 10.h),
                              CustomNumberfield(
                                controller: numbercontroller,
                                type: TextInputType.number,
                                hintText: 'Number',
                                labelText: 'Number'
                              ),
                              SizedBox(height: 20.h),
                              Text('Your Address', style: AppStyles
                                  .homelogostyle.copyWith(fontSize: 15.sp),),
                              SizedBox(height: 10.h),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppScreens.changeAddress);
                                },
                                child: Container(
                                  height: 60.h,
                                  width: 350.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppStyles.backgroundcolor
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        SvgPicture.asset(ImageAssetPath.addIcon,
                                            height: 16.67.h, width: 16.67.w),
                                        SizedBox(width: 6.67.w),
                                        Text('Add Service Location',
                                            style: AppStyles.termstyle),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text('Select Date & Time Slot', style: AppStyles
                                  .homelogostyle.copyWith(fontSize: 15.sp),),
                              SizedBox(height: 16.h),
                              Container(
                                height: 55.h,
                                width: 350.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: AppStyles.grey.withOpacity(0.20))
                                ),
                                child: Padding(padding: EdgeInsets.symmetric(
                                    horizontal: 18.sp, vertical: 5),
                                  child:

                                  Row(mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        Text('Date',
                                          style: AppStyles.termstyle.copyWith(
                                              fontSize: 12.sp),),
                                        SizedBox(height: 2.h),
                                        Text('25 Jun, 2022',
                                            style: AppStyles.homelogostyle
                                                .copyWith(fontSize: 14.sp)),
                                      ],),
                                      SvgPicture.asset(
                                          ImageAssetPath.redbooking,
                                          height: 20.h, width: 18.w),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 19.h),
                              GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: 1.45
                                  ),
                                  itemCount: timelist.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: CustomTimeContainer(

                                        time: timelist[index],
                                      ),
                                    );
                                  }
                              ),
                              SizedBox(height: 62.h),
                              CustomBottomButton(
                                onPress: () {
                                  congratulatepopup(context: context);
                                },
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
  static void congratulatepopup
      ({
    BuildContext? context,
    Function? pressLogout,
    Function? pressCancle,
    String? title,
    String? message,
    String? btn1,
    String? btn2,
  }) {
    showGeneralDialog(
      barrierLabel: "Label2",
      barrierDismissible: false,
      barrierColor: Colors.black45.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context!,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 370.h,
            width: 350.w,
            child: SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.sp),
                    topRight: Radius.circular(10.sp),
                    bottomLeft: Radius.circular(10.sp),
                    bottomRight: Radius.circular(10.sp)
                ),
                child: Scaffold(
                  body: Padding(
                      padding: EdgeInsets.only(top: 32.sp, right: 16.sp, left: 16.sp, bottom: 18.sp),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                               Image.asset(ImageAssetPath.congoImage, height: 153.h, width: 220.02.w),
                               SizedBox(height: 18.h),
                               Text('Congratulation', style: AppStyles.verifystyle.copyWith(fontSize: 18.42)) ,
                              SizedBox(height: 10.h),
                              Text('You have successfully booked your\nservice', textAlign:TextAlign.center, style: AppStyles.termstyle),
                               SizedBox(height: 20.h),
                            CustomDialogBottomButton(
                              title:'GO to Home',
                              onPress: (){
                                Navigator.pushNamed(context, AppScreens.dashboardScreen);
                              },
                            )

                          ]
                      )
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    ).then((value) => {print('Dialogue dismissed')});
  }




}





