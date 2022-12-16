import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/utils/app_styles.dart';

class CustomBookingContainer extends StatelessWidget {
  String bookingid;
  String bdate;
  String btime;
  String btype;
  String apttype;
  String bstatus;
  String aptprice;

   CustomBookingContainer({Key? key, required this.bookingid, required this.bdate, required this.btime, required this.btype, required this.apttype, required this.bstatus, required this.aptprice }) : super(key: key);

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
        child: Padding(padding: EdgeInsets.only(top: 18, right: 13, left: 13, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(bookingid, style: AppStyles.verifystyle.copyWith(fontSize: 16.sp),),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$bdate | $btime' , style: AppStyles.bookingstyle),
              Text(bstatus, style:AppStyles.bookingstyle.copyWith(color: AppStyles.bfontcolor))
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
                child:Padding(padding: EdgeInsets.only(top: 10, right: 15, left: 12, bottom: 6),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(btype, style: AppStyles.verifystyle.copyWith(fontSize: 14.sp)),
                    Text(apttype, style: AppStyles.termstyle.copyWith(fontSize: 12),),
                  ],),
                  Text('₹ $aptprice', style:AppStyles.opensansstyle ),

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
