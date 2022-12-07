import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../constants/asset_path.dart';
import '../../widgets/custom_backicon_button.dart';
import '../../widgets/custom_clickable_container.dart';
import '../../widgets/custom_dotted_divider.dart';
import 'bloc/booking_service_details_bloc.dart';

class BookServiceScreen extends StatelessWidget {
  //String sdate;
  const BookServiceScreen({Key? key}) : super(key: key);


  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookingServiceDetailsBloc>(
          create: (_) => BookingServiceDetailsBloc(),
        ),
      ],
      child: const BookServiceScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 844.h,
          width: 390.w,
         color: AppStyles.bfontcolor,
         child:
          SingleChildScrollView(
            child: Column(
              children: [
                CustomBackIconButton(
                  onPress :(){
                    Navigator.pop(context);
                  }
                ),
                SizedBox(height: 23.45.h),
                Text('#215415121515', style:AppStyles.buttonstyle.copyWith(fontSize: 16.sp)),
                Text('24 January 2022 | 03:00 pm', style: AppStyles.bookingstyle.copyWith(color: AppStyles.white),),
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
                            Column(children: [
                              Text('22 Jun, 2022', style: AppStyles.fontblackstyle.copyWith(fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 3),
                              Text('Date',style:AppStyles.termstyle),
                                                            ]
                            ),
                            Column(children: [
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
                        height: 132.h,
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
                        onPress: (){},
                      ) ,
                     SizedBox(height:8.h),
                      CustomClickableContainer(
                        text : 'Cancel Service',
                        image: ImageAssetPath.crossIcon,
                        onPress: (){},
                      ) ,
                      SizedBox(height: 48),
                      Row(children: [
                        Column(children: [
                          Text('₹ 2099', style: AppStyles.redfontstyle),
                          SizedBox(height: 11),
                          Text('Total Amount', style: AppStyles.termstyle),
                        ],),
                        SizedBox(width: 12),
                        InkWell(
                          child:Container(
                            height: 55,
                            width: 244,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppStyles.black
                            ),
                            child: Center(
                              child: Text('PAY NOW', style: AppStyles.buttonstyle),
                            ),
                          ),
                          onTap: (){},
                        )
                      ],)
                    ],
                      ),

                    )
                  ],)
                ),

            ),
          ),
        );
  }
}
