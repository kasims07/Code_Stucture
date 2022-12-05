import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/utils/app_styles.dart';

class BookServiceScreen extends StatelessWidget {
  const BookServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 844.h,
        width: 390.w,
       child:
        Container(
          height: 686.h,
          width: 390.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
            topRight: Radius.circular(15),),
             color: AppStyles.white
            ),
          child : Padding(padding: EdgeInsets.all(20),
          child:Column(children: [
            Container(
              height:201.h ,
              width: 350.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
              color: AppStyles.backgroundcolor),

            )
          ],)
          )
        ),
      ),
    );
  }
}
