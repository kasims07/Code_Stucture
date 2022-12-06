import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gfive/utils/app_styles.dart';

import '../../widgets/custom_note_container.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //height:844.h ,
          width: 390.w,
          color: AppStyles.black,
          child: Column(children: [
            Padding(padding: EdgeInsets.only(top:49.sp , right:136.sp , left:136.sp , bottom:24.sp),
            child: Text('Notifications', style:AppStyles.profilestyle),),
            Container(
                height:915.h ,
                width: 390.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  color: AppStyles.white
                ),
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index){
                    return CustomNoteContainer(
                      text1: 'Gfive Service accepted your service\nrequest.',
                      text2: '20 min ago',
                    );
                  })


            )
          ],),
        ),
      ),
    )
    );
  }
}
