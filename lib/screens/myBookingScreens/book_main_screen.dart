import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../widgets/custom_booking_container.dart';

class BookMainScreen extends StatelessWidget {
  const BookMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      body: SingleChildScrollView(
        child: Container(

          height:844.h ,
          width: 390.w,
          color: AppStyles.black,
          child:
            Column(children: [
              Padding(padding: EdgeInsets.only(top: 49, right: 138, left: 138, bottom: 24),
              child: Text('My Bookings', style:  AppStyles.profilestyle),
        ),
              Expanded(
                child: Container(
                  height: 915.h,
                  width: 390.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      
                    ),
                    color: AppStyles.white
                  ),
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context,  int index)
                     { return CustomBookingContainer(
                       bookingid: '#215415121515',
                       bdate: '24 January 2022',
                       btime: '03:00 pm',
                       btype: 'Unfurnished Apartment\nclassic',
                       apttype: '1BHK',
                       bstatus: 'Upcoming',
                       aptprice: '2099',
                     );
                     }



                     )



                  ),
              ),

            ],
          )
        ),
      ),
    ));
  }
}
