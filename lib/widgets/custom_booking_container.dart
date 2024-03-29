import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/utils/app_styles.dart';

class CustomBookingContainer extends StatelessWidget {
  String bookingid;
  String bdate;
  String btime;
  String subservice;
  String prizetitle;
  String bstatus;
  String prize;
  TextStyle statusfontstyle;

   CustomBookingContainer({Key? key, required this.bookingid, required this.bdate, required this.btime, required this.subservice, required this.prizetitle, required this.bstatus, required this.prize, required this.statusfontstyle }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(bottom: 10),
      child: Container(
        height: 175.h ,
        width: 350.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:AppStyles.grey.withOpacity(0.05),
        ),
        child: Padding(padding: EdgeInsets.only(top: 15, right: 13, left: 13, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(bookingid, style: AppStyles.verifystyle.copyWith(fontSize: 16.sp),),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$bdate | $btime' , style: AppStyles.bookingstyle),
              Text(bstatus, style:statusfontstyle
              //AppStyles.bookingstyle.copyWith(color: AppStyles.bfontcolor)
              )
            ],
          ),
           SizedBox(height: 16),
           Expanded(
             child: Container(
                height: 90.h,
                width: 324.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppStyles.white
                ),
                child:Padding(padding: EdgeInsets.only(top: 8, right: 15, left: 12, bottom: 4),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(subservice, style: AppStyles.verifystyle.copyWith(fontSize: 14.sp)),
                    SizedBox(height: 3.h),
                    Text(prizetitle, style: AppStyles.termstyle.copyWith(fontSize: 12),),
                  ],),
                  Text('₹ $prize', style:AppStyles.opensansstyle ),

                ],)
                  ,)
              ),
           ),
          ]
          )

        ),
        ),
    );
  }
}
