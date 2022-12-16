import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../constants/asset_path.dart';
import '../../widgets/custom_account_backbutton.dart';
import '../../widgets/custom_backicon_button.dart';
import '../../widgets/custom_bottom_button.dart';
import '../../widgets/custom_cancelservice_container.dart';
import '../../widgets/custom_clickable_container.dart';
import '../../widgets/custom_dialog_bottom_button.dart';
import '../../widgets/custom_dotted_divider.dart';
import '../../widgets/custom_time_container.dart';
import 'bloc/booking_service_details_bloc.dart';

class BookServiceScreen extends StatelessWidget {
  //String sdate;
  BookServiceScreen({Key? key}) : super(key: key);

  List timelist = ['08:00','10:00','11:00','12:00','01:00','02:00','03:00'];


  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookingServiceDetailsBloc>(
          create: (_) => BookingServiceDetailsBloc(),
        ),
      ],
      child:  BookServiceScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children:[
              Container(
                //height: 844.h,
                width: 390.w,
                color: AppStyles.yellow,
          ),
          Container(
            height: 844.h,
              width: 390.w,
              color: AppStyles.bfontcolor,
              child: Image.asset(ImageAssetPath.dotted, fit: BoxFit.fill)),

          Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAccountBackbutton(),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 100.h),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('#215415121515', style:AppStyles.buttonstyle.copyWith(fontSize: 16.sp)),
                            Text('24 January 2022 | 03:00 pm', style: AppStyles.bookingstyle.copyWith(color: AppStyles.white),),
                          ],
                        )

                      ],
                    ),

                    SizedBox(height: 26.h),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      height: 686.h,
                      width: 390.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppStyles.white
                      ),
                      child : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //padding: EdgeInsets.only(top: 23.sp),

                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                                color: AppStyles.backgroundcolor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 23.sp, left: 16.sp, bottom: 19.sp),
                                  child: Row(children: [
                                    Text('Service Date -Time & Address', style: AppStyles.fontblackstyle),
                                  ],),
                                ),
                                MySeparator(height:0.5, color: AppStyles.grey),
                                Padding(padding: EdgeInsets.only(top: 13.sp, right: 16.sp, left: 16.sp, bottom: 16.sp),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[
                                    Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('22 Jun, 2022', style: AppStyles.fontblackstyle.copyWith(fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(height: 3),
                                          Text('Date',textAlign:TextAlign.start, style:AppStyles.termstyle),
                                        ]
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('08:00 AM', style: AppStyles.fontblackstyle.copyWith(fontWeight: FontWeight.w700),),
                                        SizedBox(height: 5),
                                        Text('Time',style:AppStyles.termstyle),
                                      ],),

                                  ]),
                                ),
                                MySeparator(height:0.5, color: AppStyles.grey),
                                Padding(
                                    padding: const EdgeInsets.only(top: 15, left: 16, bottom: 15),
                                    child: Row(children: [
                                      SvgPicture.asset(ImageAssetPath.bookLocation, height: 43.h, width: 43.w),
                                      SizedBox(width: 11.w),
                                      Text('1270 D Street Southfield,\nMI 48235 ', style:AppStyles.sfstyle),
                                    ],)
                                )
                              ],),
                          ),
                          Padding(padding: EdgeInsets.only(top: 15, bottom: 14),
                            child: Text('Service Info', style: AppStyles.fontblackstyle),
                          ),
                          Container(
                            //height: 132.h,
                              width: 350.w,
                              padding: EdgeInsets.only(top: 23.sp , left: 19.sp , bottom: 14.sp),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                                  color: AppStyles.backgroundcolor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Full Home Deep Cleaning', style:AppStyles.fontblackstyle.copyWith(fontSize: 16.sp) ),
                                  SizedBox(height: 5.h),
                                  Text('Unfurnished Apartment classic\ncleaning', style: AppStyles.termstyle),
                                  SizedBox(height: 5.h),
                                  Text('1BHK', style:AppStyles.redstyle),
                                ],)
                          ),
                          SizedBox(height: 15.h),
                          CustomClickableContainer(
                            text : 'Reschedule Service',
                            image: ImageAssetPath.calenderIcon,
                            onPress: (){
                              print('Hellow');
                              rescheduleDialog(context: context, timelist: timelist);
                            },
                          ) ,
                          SizedBox(height:8.h),
                          CustomClickableContainer(
                            text : 'Cancel Service',
                            image: ImageAssetPath.crossIcon,
                            onPress: (){
                              cancelDialog(context: context);
                            },
                          ) ,
                          SizedBox(height: 35),
                          Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('₹ 2099', style: AppStyles.redfontstyle),
                                SizedBox(height: 11),
                                Text('Total Amount', style: AppStyles.termstyle),
                              ],),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: (){
                                paymentDialog(context: context);
                              },
                              child: Container(
                                height: 55,
                                width: 234,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppStyles.black
                                ),
                                child: Center(
                                  child: Text('PAY NOW', style: AppStyles.buttonstyle),
                                ),
                              ),
                            )
                          ],)
                        ],
                      ),

                    )
                  ],),


              /*SizedBox(
                  height: 844.h,
                  child: Image.asset(ImageAssetPath.dotted, fit: BoxFit.fill)),*/
            ]
          ),
        ),
      ),
    );
  }

  static void paymentDialog({
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
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 350.h,
            child: SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.sp),
                    topRight: Radius.circular(10.sp)),
                child: Scaffold(
                  body:
                  Container(
                    height:350,
                    width:390,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 26, horizontal: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Payment', style: AppStyles.homelogostyle.copyWith(fontSize: 18.sp),),
                              SizedBox(height: 10.h),
                              Text('Enter your service amount and pay to\nservice provider', textAlign: TextAlign.center, style: AppStyles.termstyle.copyWith(fontSize: 15.sp),),
                              SizedBox(height: 19.h),
                              Container(
                                height: 105.h,
                                width: 349.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppStyles.lightgrey
                                ),
                                child: Center(
                                  child: Text('Enter Amount', style: AppStyles.termstyle.copyWith(fontSize: 20.sp, fontWeight: FontWeight.w700),),),
                              ),
                              SizedBox(height:23.h),
                              CustomDialogBottomButton(
                                title: 'Submit',
                                onPress: (){},
                              ),
                            ]
                        )
                    ),
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

  static void rescheduleDialog({
    BuildContext? context,
    Function? pressLogout,
    Function? pressCancle,
    String? title,
    String? message,
    String? btn1,
    String? btn2,
    List? timelist
  }) {
    showGeneralDialog(
      barrierLabel: "Label2",
      barrierDismissible: true,
      barrierColor: Colors.black45.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context!,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 467.h,
            child: SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.sp),
                    topRight: Radius.circular(10.sp)),
                child: Scaffold(
                  body:
                  Container(
                    // height:350,
                    width:390,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                        padding: EdgeInsets.only(top:26, right: 20, left: 20, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Reschedule Service', style:AppStyles.homelogostyle.copyWith(fontSize: 18.sp) ,),
                              SizedBox(height: 10.h),
                              Text('Choose your preferred date& time\nreschedule services.',textAlign: TextAlign.center
                                , style: AppStyles.termstyle.copyWith(fontSize: 15.sp),),
                              SizedBox(height: 35.h),
                              Text('Select Date & Time Slot', style: AppStyles.homelogostyle.copyWith(fontSize: 15.sp),),
                              SizedBox(height: 16.sp),
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
                              //SizedBox(height: 2.h),
                              Expanded(
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 8.0,
                                        mainAxisSpacing: 8.0,
                                        childAspectRatio: 1.45
                                    ),
                                    itemCount: timelist!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: CustomTimeContainer(
                                          //isSelected: false,
                                          time: timelist[index],
                                        ),
                                      );
                                    }
                                ),
                              ),
                              SizedBox(height: 20.h),
                              CustomDialogBottomButton(
                                title: 'Reschedule',
                                onPress: (){},
                              ),




                            ]
                        )
                    ),
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

  static void cancelDialog({
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
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 588.h,
            child: SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.sp),
                    topRight: Radius.circular(10.sp)),
                child: Scaffold(
                  body: Container(
                    height: 588.h,
                      width: 390.w,
                    color: AppStyles.white,
                    child:
                    Column(
                      children: [
                        SizedBox(height: 26.h),
                        Text('Cancel Service', style :AppStyles.homelogostyle.copyWith(fontSize: 18.sp)),
                        SizedBox(height: 10.h),
                        Text('Cancel service by giving proper reason.', style: AppStyles.termstyle.copyWith(fontSize: 15.sp),),
                       Padding(padding: EdgeInsets.only(top: 30.sp, right: 36.sp, left: 36.sp),
                         child: Column(children: [
                           CustomCancelServiceContainer(
                             text: 'We are not at home',
                            // isCancelselected: false,
                           ),
                           SizedBox(height: 10.h),
                           CustomCancelServiceContainer(
                             text: 'Booked by mistake',
                            // isCancelselected: false,
                           ),
                           SizedBox(height: 10.h),
                           CustomCancelServiceContainer(
                             text: 'Other',
                             //isCancelselected: false,
                           ),
                           SizedBox(height: 10.h),
                           Container(
                             height: 131.h,
                             width: 318.w,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(5),
                               border: Border.all( color: AppStyles.grey.withOpacity(0.2)),
                               color: AppStyles.white
                             ),
                             child: Padding(
                               padding: EdgeInsets.symmetric(horizontal:12.sp, vertical: 12.sp),
                               child: Text('Description', style: AppStyles.termstyle),
                             ),
                           )
                         ],),
                       ),
                        SizedBox(height: 100.h),
                        CustomBottomButton(
                          onPress: (){},
                          text: 'Submit',
                        )

                           
                         ],
                       )

                    )

                  )

                        )
                        )
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
